require 'rails_helper'

RSpec.describe "archives/index", type: :view do
  before(:each) do
    assign(:archives, [
      Archive.create!(
        :handle => "Handle",
        :name => "Name",
        :maintainer_email => "Maintainer Email",
        :description => "MyText",
        :url => "Url"
      ),
      Archive.create!(
        :handle => "Handle",
        :name => "Name",
        :maintainer_email => "Maintainer Email",
        :description => "MyText",
        :url => "Url"
      )
    ])
  end

  it "renders a list of archives" do
    render
    assert_select "tr>td", :text => "Handle".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Maintainer Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
