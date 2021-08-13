require 'rails_helper.rb'

RSpec.describe "papers/show", :type => :view do

  let(:user) { FactoryBot.create(:princeton_admin) }

  before(:each) do
    sign_in user
  end

  it "displays the paper title" do
    assign(:paper, Paper.new(id: 123, title: "Chicago", series: Series.create))
    render
    expect(rendered).to include("Chicago")
  end
end