require 'rails_helper'

RSpec.describe "series/index", type: :feature do

  context "As an admin user" do
    let(:user) { FactoryBot.create(:princeton_admin) }

    before(:each) do
      # assign(:series, [
        s1 = Series.create!(
          :name => "Foo",
          :provider_institution => "pri:wwww",
          :handle => "handle2"
        )
        s2 = Series.create!(
          :name => "Bar",
          :provider_institution => "pri:zzzz",
          :handle => "handle1"
        )
      # ])
        s1.save
        s2.save
      sign_in user
    end

    it "renders a list of series" do
      visit '/series'
      expect(page).to have_content 'View RDF'
      # render
      assert_selector "tr>td", :text => "Foo".to_s
      assert_selector "tr>td", :text => "Bar".to_s
    end
  end
end
