# frozen_string_literal: true

require 'rails_helper'

# The previous series coverage was just a scaffold-generated controller spec
# checking `assigns(:series)`, with several examples `skip`ped. These
# describe the actual, browser-visible behavior: index/show are public,
# new/create/edit/update require *any* signed-in user (not specifically an
# admin -- `@current_user&.admin?` only toggles whether links/forms render),
# the show page also lists every paper attached to the series, and there's
# no destroy link anywhere in these views.
RSpec.describe "Series", type: :feature do
  let(:series) do
    Series.create!(
      name: "Working Papers",
      provider_name: "Princeton University Department of Economics",
      provider_homepage: "https://economics.princeton.edu",
      provider_institution: "Princeton University",
      maintainer_name: "Econ IT",
      maintainer_email: "econ-it@princeton.edu",
      series_type: "ReDIF-Paper",
      handle: "wp",
      sectionurlid: "wp",
      base_url: "https://www.princeton.edu/repec/wp/",
      pri_handle: "pu"
    )
  end

  describe "index" do
    it "lists every series, with its paper count, to a guest" do
      series
      Paper.create!(series_id: series.id, title: "Paper One")
      Paper.create!(series_id: series.id, title: "Paper Two")
      visit series_index_path

      expect(page).to have_content("Working Papers")
      expect(page).to have_content("Princeton University")
      expect(page).to have_content("2") # paper count column
      expect(page).to have_no_link("Add New Series")
    end

    it "shows the add-series link to a signed-in admin" do
      sign_in FactoryBot.create(:princeton_admin)
      visit series_index_path

      expect(page).to have_link("Add New Series")
    end
  end

  describe "show" do
    it "shows every one of a series' displayed fields, and its attached papers, to a guest" do
      paper = Paper.create!(
        series_id: series.id,
        title: "A Working Paper",
        papernumber: "001",
        url: "https://www.princeton.edu/repec/wp/001.pdf"
      )
      visit series_path(series)

      # The show view only renders name, provider_institution, provider_homepage,
      # handle, pri_handle, and sectionurlid -- not provider_name, maintainer_name,
      # maintainer_email, series_type, or base_url, even though those are real
      # fields set on `series` and fillable on the new/edit form.
      expect(page).to have_content("Working Papers")
      expect(page).to have_content("Princeton University")
      expect(page).to have_link("https://economics.princeton.edu", href: "https://economics.princeton.edu")
      expect(page).to have_content("wp") # handle ("Section ID")
      expect(page).to have_content("pu") # pri_handle ("Princeton Handle")
      expect(page).to have_content("1 Attached Papers")
      expect(page).to have_content(paper.title)
      expect(page).to have_link(paper.papernumber, href: paper.url)
      expect(page).to have_no_link("Edit Series")
      expect(page).to have_no_link("Add New Paper")
    end

    it "shows admin-only edit/add-paper links to a signed-in admin" do
      sign_in FactoryBot.create(:princeton_admin)
      visit series_path(series)

      expect(page).to have_link("Edit Series")
      expect(page).to have_link("Add New Paper")
    end
  end

  describe "creating a series" do
    it "redirects a guest to the homepage instead of the new-series form" do
      visit new_series_path

      expect(page).to have_current_path(root_path)
    end

    it "lets any signed-in user create a series with every permitted field filled in, not just an admin" do
      sign_in FactoryBot.create(:valid_princeton_patron)
      visit new_series_path

      # pri_handle and base_url aren't here: series_params doesn't permit either
      # one, so the form has no fields for them at all.
      fill_in "Name", with: "New Series"
      fill_in "Provider name", with: "New University Department"
      fill_in "Provider homepage", with: "https://example.org"
      fill_in "Provider institution", with: "New University"
      fill_in "Maintainer name", with: "New IT"
      fill_in "Maintainer email", with: "it@example.org"
      fill_in "Series type", with: "ReDIF-Paper"
      fill_in "Handle", with: "newseries"
      fill_in "Sectionurlid", with: "newseries"
      click_button "Create Series"

      expect(page).to have_content("Series was successfully created")
      expect(page).to have_content("New Series")
      expect(page).to have_content("New University")
      expect(page).to have_link("https://example.org", href: "https://example.org")
      expect(page).to have_content("newseries")
    end
  end

  describe "editing a series" do
    it "renders a blank edit page for a signed-in non-admin -- the request isn't blocked, only the form" do
      sign_in FactoryBot.create(:valid_princeton_patron)
      visit edit_series_path(series)

      expect(page).to have_no_field("Name")
    end

    it "lets an admin edit a series" do
      sign_in FactoryBot.create(:princeton_admin)
      visit edit_series_path(series)
      fill_in "Name", with: "Renamed Series"
      click_button "Update Series"

      expect(page).to have_content("Series was successfully updated")
      expect(page).to have_content("Renamed Series")
    end
  end
end
