# frozen_string_literal: true

require 'rails_helper'

# The previous archives coverage was just a scaffold-generated controller
# spec checking `assigns(:archive)`, with several examples `skip`ped. These
# describe the actual, browser-visible behavior: index/show are public,
# new/create/edit/update require *any* signed-in user (not specifically an
# admin -- `@current_user&.admin?` only toggles whether links/forms render),
# and there's no destroy link anywhere in these views.
RSpec.describe "Archives", type: :feature do
  let(:archive) do
    Archive.create!(
      name: "Princeton Economics",
      handle: "RePEc:pu",
      maintainer_email: "econ@princeton.edu",
      description: "The RePEc archive for Princeton's economics department.",
      url: "https://www.princeton.edu/repec/pu"
    )
  end

  describe "index" do
    it "lists every archive to a guest, with no admin-only links" do
      archive
      visit archives_path

      expect(page).to have_content("Princeton Economics")
      expect(page).to have_content("RePEc:pu")
      expect(page).not_to have_link("Add New Archive")
      expect(page).not_to have_link("Edit")
    end

    it "shows the add-archive link to a signed-in admin" do
      sign_in FactoryBot.create(:princeton_admin)
      visit archives_path

      expect(page).to have_link("Add New Archive")
    end

    it "does not show the add-archive link to a signed-in non-admin" do
      sign_in FactoryBot.create(:valid_princeton_patron)
      visit archives_path

      expect(page).not_to have_link("Add New Archive")
    end
  end

  describe "show" do
    it "shows every one of an archive's fields to a guest, with no edit link" do
      visit archive_path(archive)

      expect(page).to have_content("RePEc:pu")
      expect(page).to have_content("Princeton Economics")
      expect(page).to have_content("econ@princeton.edu")
      expect(page).to have_content("The RePEc archive for Princeton's economics department.")
      expect(page).to have_content("https://www.princeton.edu/repec/pu")
      expect(page).not_to have_link("Edit")
    end

    it "shows the editlink to a signed-in admin" do
      sign_in FactoryBot.create(:princeton_admin)
      visit archive_path(archive)

      expect(page).to have_content("RePEc:pu")
      expect(page).to have_content("Princeton Economics")
      expect(page).to have_content("econ@princeton.edu")
      expect(page).to have_content("The RePEc archive for Princeton's economics department.")
      expect(page).to have_content("https://www.princeton.edu/repec/pu")
      expect(page).to have_link("Edit")
    end
  end

  describe "creating an archive" do
    it "redirects a guest to the homepage instead of the new-archive form" do
      visit new_archive_path

      expect(page).to have_current_path(root_path)
    end

    it "lets any signed-in user create an archive with every field filled in, not just an admin" do
      sign_in FactoryBot.create(:valid_princeton_patron)
      visit new_archive_path

      fill_in "Handle", with: "RePEc:new"
      fill_in "Name", with: "New Archive"
      fill_in "Maintainer email", with: "new@example.org"
      fill_in "Description", with: "A brand new archive."
      fill_in "Url", with: "https://example.org/repec/new"
      click_button "Create Archive"

      expect(page).to have_content("Archive was successfully created")
      expect(page).to have_content("Handle RePEc:new")
      expect(page).to have_content("Name New Archive")
      expect(page).to have_content("Maintainer Email new@example.org")
      expect(page).to have_content("Description A brand new archive.")
      expect(page).to have_content("URL https://example.org/repec/new")
    end
  end

  describe "editing an archive" do
    it "renders a blank edit page for a signed-in non-admin -- the request isn't blocked, only the form" do
      sign_in FactoryBot.create(:valid_princeton_patron)
      visit edit_archive_path(archive)
      expect(page).to have_content("Editing Archive")
      expect(page).not_to have_field("Name")
      expect(page).not_to have_button("Update Archive")
    end

    it "lets an admin edit an archive" do
      sign_in FactoryBot.create(:princeton_admin)
      visit edit_archive_path(archive)
      expect(page).to have_content("Editing Archive")
      fill_in "Name", with: "Renamed Archive"
      click_button "Update Archive"

      expect(page).to have_content("Archive was successfully updated")
      expect(page).to have_content("Name Renamed Archive")
    end
  end
end
