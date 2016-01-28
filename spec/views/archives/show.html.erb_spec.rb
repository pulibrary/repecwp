require 'rails_helper'

RSpec.describe "archives/show", type: :view do
  before(:each) do
    @archive = assign(:archive, Archive.create!(
      :handle => "Handle",
      :name => "Name",
      :maintainer_email => "Maintainer Email",
      :description => "MyText",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Handle/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Maintainer Email/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Url/)
  end
end
