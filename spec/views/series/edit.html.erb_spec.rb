require 'rails_helper'

RSpec.describe "series/edit", type: :view do
  before(:each) do
    @series = assign(:series, Series.create!(
      :name => "Foo",
      :provider_institution => "pri:wwww",
      :handle => "handle2"
    ))
    @current_user = user
  end

  let(:user) { FactoryBot.create(:princeton_admin) }

  it "renders the edit series form" do
    render

    assert_select "form[action=?][method=?]", series_path(@series), "post" do

      assert_select "input#series_name[name=?]", "series[name]"

      assert_select "input#series_provider_institution[name=?]", "series[provider_institution]"

      assert_select "input#series_handle[name=?]", "series[handle]"
    end
  end
end
