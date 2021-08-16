require 'rails_helper'

RSpec.describe "series/show", type: :view do
  before(:each) do
    @series = assign(:series, Series.create!(
      :name => "Foo",
      :provider_institution => "pri:wwww",
      :handle => "handle2",
      :provider_homepage => "http://example.com"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Foo/)
    expect(rendered).to match(/pri:wwww/)
    expect(rendered).to match(/handle2/)
  end
end
