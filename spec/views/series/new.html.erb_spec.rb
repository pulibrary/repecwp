require 'rails_helper'

RSpec.describe "series/new", type: :view do
  before(:each) do
    assign(:series, Series.new(
      :title => "MyString",
      :sectionid => "MyString",
      :sectionpath => "MyString"
    ))
  end

  it "renders new series form" do
    render

    assert_select "form[action=?][method=?]", series_index_path, "post" do

      assert_select "input#series_title[name=?]", "series[title]"

      assert_select "input#series_sectionid[name=?]", "series[sectionid]"

      assert_select "input#series_sectionpath[name=?]", "series[sectionpath]"
    end
  end
end
