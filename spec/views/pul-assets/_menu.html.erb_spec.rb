require 'rails_helper'

RSpec.describe "pul-assets/_menu", type: :view, js: true do
  let(:omniauth_response) { OmniAuth::AuthHash.new(provider: 'cas', uid: 'someuid') }
  before do
    OmniAuth.config.mock_auth[:cas] = omniauth_response
  end
  it 'has a login button' do
    render
    expect(rendered).to include('RDF Files')
    expect(rendered).to include('Login')
  end
  it 'can try to log in and see notification flash' do
    visit '/'
    page.click_link('Login')
    expect(page.body).to include('You are not authorized to manage this application')
  end
  context 'with a logged in user' do
    let(:user) { FactoryBot.create(:princeton_admin) }
    before do
      sign_in user
    end
    it "shows the user's name" do
      render 
      expect(rendered).to include("Logout #{user.uid}")
    end
  end
  context 'with a created user' do
    let(:user) { FactoryBot.create(:princeton_admin) }
    before do
      allow(User).to receive(:from_omniauth).and_return(user)
    end
    it 'allows the user to login via the ui' do
      visit '/'
      page.click_link('Login')
      expect(page.body).to include('Successfully authenticated from CAS account.')
      expect(page.body).to include("Logout #{user.uid}")
    end
  end
end
