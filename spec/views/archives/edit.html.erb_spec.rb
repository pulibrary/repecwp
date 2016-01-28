require 'rails_helper'

RSpec.describe "archives/edit", type: :view do
  before(:each) do
    @archive = assign(:archive, Archive.create!(
      :handle => "MyString",
      :name => "MyString",
      :maintainer_email => "MyString",
      :description => "MyText",
      :url => "MyString"
    ))
  end

  it "renders the edit archive form" do
    render

    assert_select "form[action=?][method=?]", archive_path(@archive), "post" do

      assert_select "input#archive_handle[name=?]", "archive[handle]"

      assert_select "input#archive_name[name=?]", "archive[name]"

      assert_select "input#archive_maintainer_email[name=?]", "archive[maintainer_email]"

      assert_select "textarea#archive_description[name=?]", "archive[description]"

      assert_select "input#archive_url[name=?]", "archive[url]"
    end
  end
end
