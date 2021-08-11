require 'rails_helper'

RSpec.describe "series/new", type: :view do
  before(:each) do
    assign(:series, Series.new(
      :name => "Foo",
      :provider_institution => "pri:wwww",
      :handle => "handle2"
    ))
  end

  it "renders new series form" do
    render

    assert_select "form[action=?][method=?]", series_index_path, "post" do

      assert_select "input#series_name[name=?]", "series[name]"

      assert_select "input#series_provider_institution[name=?]", "series[provider_institution]"

      assert_select "input#series_handle[name=?]", "series[handle]"
    end
  end
end
