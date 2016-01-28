require 'rails_helper'

RSpec.describe "archives/new", type: :view do
  before(:each) do
    assign(:archive, Archive.new(
      :handle => "MyString",
      :name => "MyString",
      :maintainer_email => "MyString",
      :description => "MyText",
      :url => "MyString"
    ))
  end

  it "renders new archive form" do
    render

    assert_select "form[action=?][method=?]", archives_path, "post" do

      assert_select "input#archive_handle[name=?]", "archive[handle]"

      assert_select "input#archive_name[name=?]", "archive[name]"

      assert_select "input#archive_maintainer_email[name=?]", "archive[maintainer_email]"

      assert_select "textarea#archive_description[name=?]", "archive[description]"

      assert_select "input#archive_url[name=?]", "archive[url]"
    end
  end
end
