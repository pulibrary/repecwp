# frozen_string_literal: true
require "rails_helper"

describe "accessibility", type: :feature, js: true do
  let(:user) { FactoryBot.create(:princeton_admin) }

  before(:each) do
    sign_in user
  end

  context "series listing page" do
    before do
      visit "/"
    end

    it "complies with wcag" do
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
    end
  end

  context "list of papers" do
    before do
      visit "/econlib/RePEc/pri/series/2"
    end

    it "complies with wcag" do
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
    end
  end

  context "adding a new series" do
    before do
      visit "/series/new"
    end

    it "complies with wcag" do
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
    end
  end
end