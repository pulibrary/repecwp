require 'rails_helper'

RSpec.describe "series/show", type: :view do
  before(:each) do
    @series = assign(:series, Series.create!(
      :title => "Title",
      :sectionid => "Sectionid",
      :sectionpath => "Sectionpath"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Sectionid/)
    expect(rendered).to match(/Sectionpath/)
  end
end
