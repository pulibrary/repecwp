RSpec.describe "papers/show", :type => :view do

  let(:user) { FactoryGirl.create(:princeton_admin) }

  before(:each) do
    sign_in user
  end

  it "displays the paper title" do
    assign(:event, Event.new(:location => "Chicago"))
    render
    expect(rendered).to include("Chicago")
  end
end