RSpec.describe "papers/show", :type => :view do
  it "displays the paper title" do
    render
    expect(rendered).to include("Chicago")
  end
end