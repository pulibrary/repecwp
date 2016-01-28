require 'rails_helper'

RSpec.describe "series/edit", type: :view do
  before(:each) do
    @series = assign(:series, Series.create!(
      :title => "MyString",
      :sectionid => "MyString",
      :sectionpath => "MyString"
    ))
  end

  it "renders the edit series form" do
    render

    assert_select "form[action=?][method=?]", series_path(@series), "post" do

      assert_select "input#series_title[name=?]", "series[title]"

      assert_select "input#series_sectionid[name=?]", "series[sectionid]"

      assert_select "input#series_sectionpath[name=?]", "series[sectionpath]"
    end
  end
end
