# frozen_string_literal: true

require 'rails_helper'

# repecwp had no feature-spec coverage at all for papers -- only
# spec/views/papers/show.html.erb_spec.rb, a Rails view spec that stubs
# `assign(:paper, ...)` and never exercises routing, auth, or the
# index/new/edit/destroy flows. These describe the real, browser-visible
# behavior, which differs from archives/series in two notable ways:
#
# - **index requires sign-in** here (`skip_before_action :authenticate_user!,
#   only: [:show]` -- note `:index` is *not* in that list, unlike the
#   archives/series controllers). Only `show` is public.
# - the index page's Edit/Destroy links are **not** gated behind `admin?` at
#   all (unlike the edit page, which is) -- any signed-in user sees and can
#   click them straight from the index.
RSpec.describe "Papers", type: :feature do
  let(:series) do
    Series.create!(name: "Working Papers", sectionurlid: "wp", base_url: "https://www.princeton.edu/repec/wp/")
  end
  let(:paper) do
    Paper.create!(
      series_id: series.id,
      title: "A Working Paper",
      author1first: "Jane", author1mid: "Q", author1last: "Doe", author1workplace: "Princeton University",
      author2first: "John", author2mid: nil, author2last: "Roe", author2workplace: "Harvard University",
      abstract: "This paper studies something important.",
      creationdate: "2026-01-01",
      sectionurlid: "wp",
      papernumber: "001",
      url: "https://www.princeton.edu/repec/wp/001.pdf",
      filefunction: "application/pdf",
      jel: "D01, E52",
      keywords: "monetary policy, inflation",
      suppress: false,
      wpid: 42
    )
  end

  describe "index" do
    it "redirects a guest to the homepage instead of the papers list" do
      visit papers_path

      expect(page).to have_current_path(root_path)
    end

    it "lists every paper, with working Edit/Destroy links, to any signed-in user" do
      paper
      sign_in FactoryBot.create(:valid_princeton_patron)
      visit papers_path

      expect(page).to have_content("A Working Paper")
      expect(page).to have_link("Edit")
      expect(page).to have_link("Destroy")
    end
  end

  describe "show" do
    it "shows every one of a paper's fields to a guest, with no edit link" do
      visit paper_path(paper)

      expect(page).to have_content("A Working Paper")
      expect(page).to have_content("Jane")
      expect(page).to have_content("Doe")
      expect(page).to have_content("Princeton University")
      expect(page).to have_content("John")
      expect(page).to have_content("Roe")
      expect(page).to have_content("Harvard University")
      expect(page).to have_content("This paper studies something important.")
      expect(page).to have_content("2026-01-01")
      expect(page).to have_content("001")
      expect(page).to have_content("https://www.princeton.edu/repec/wp/001.pdf")
      expect(page).to have_content("application/pdf")
      expect(page).to have_content("D01, E52")
      expect(page).to have_content("monetary policy, inflation")
      expect(page).to have_content("false") # suppress
      expect(page).to have_content(series.id.to_s) # @paper.series_id is shown raw, not the series' name
      expect(page).not_to have_link("Edit")
    end

    it "shows the edit link to a signed-in admin" do
      sign_in FactoryBot.create(:princeton_admin)
      visit paper_path(paper)

      expect(page).to have_link("Edit")
    end
  end

  describe "creating a paper" do
    it "redirects a guest to the homepage instead of the new-paper form" do
      visit new_paper_path

      expect(page).to have_current_path(root_path)
    end

    it "lets any signed-in user create a paper with every field filled in, not just an admin" do
      series # belongs_to :series requires presence -- the form picks it by sectionurlid
      sign_in FactoryBot.create(:valid_princeton_patron)
      visit new_paper_path

      fill_in "Title", with: "New Paper"
      fill_in "Author1first", with: "Ada"
      fill_in "Author1mid", with: "L"
      fill_in "Author1last", with: "Lovelace"
      fill_in "Author1workplace", with: "Analytical Engine Society"
      fill_in "Author2first", with: "Alan"
      fill_in "Author2last", with: "Turing"
      fill_in "Author2workplace", with: "Bletchley Park"
      fill_in "Abstract", with: "An abstract describing the new paper."
      fill_in "Creationdate", with: "2026-02-01"
      fill_in "Sectionurlid", with: "wp"
      fill_in "Papernumber", with: "002"
      fill_in "Url", with: "https://www.princeton.edu/repec/wp/002.pdf"
      fill_in "Filefunction", with: "application/pdf"
      fill_in "Jel", with: "C01, D80"
      fill_in "Keywords", with: "computation, cryptography"
      check "Suppress"
      select series.sectionurlid, from: "Series"
      click_button "Create Paper"

      expect(page).to have_content("Paper was successfully created")
      expect(page).to have_content("Title New Paper")
      expect(page).to have_content("Author(s) Ada L Lovelace Ada Lovelace (Analytical Engine Society) Alan Turing Alan Turing (Bletchley Park)")
      expect(page).to have_content("Abstract An abstract describing the new paper.")
      expect(page).to have_content("https://www.princeton.edu/repec/wp/002.pdf")
      expect(page).to have_content("Jel C01, D80")
      expect(page).to have_content("Keyword(s) computation, cryptography")
      expect(page).to have_content("Suppress true") # suppress
      expect(page).to have_content("Series #{series.id}") # @paper.series_id is shown raw, not the series' name
    end
  end

  describe "editing a paper" do
    it "renders a blank edit page for a signed-in non-admin -- the form itself is admin-gated" do
      sign_in FactoryBot.create(:valid_princeton_patron)
      visit edit_paper_path(paper)
      expect(page).to have_content("Editing Paper")
      expect(page).not_to have_field("Title")
      expect(page).not_to have_button("Update Paper")
    end

    it "lets an admin edit a paper" do
      sign_in FactoryBot.create(:princeton_admin)
      visit edit_paper_path(paper)
      expect(page).to have_content("Editing Paper")
      fill_in "Title", with: "Renamed Paper"
      click_button "Update Paper"

      expect(page).to have_content("Paper was successfully updated")
      expect(page).to have_content("Title Renamed Paper")
    end
  end

  describe "destroying a paper", js: true do
    it "lets any signed-in user destroy a paper straight from the index" do
      paper
      sign_in FactoryBot.create(:princeton_admin)
      visit papers_path
      accept_confirm do
        click_on "Destroy"
      end
      expect(page).to have_content("Paper was successfully destroyed")
      expect(page).not_to have_content("A Working Paper")
    end
  end
end
