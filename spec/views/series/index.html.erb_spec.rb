require 'rails_helper'

RSpec.describe "series/index", type: :feature do

  context "As an admin user" do
    let(:user) { FactoryGirl.create(:princeton_admin) }

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
      binding.pry
      expect(page).to have_content 'Edit'
      # render
      # assert_select "tr>td", :text => "Name".to_s, :count => 2
      # assert_select "tr>td", :text => "Provider Institution".to_s, :count => 2
      # assert_select "tr>td", :text => "Handle".to_s, :count => 2
    end
  end
end
