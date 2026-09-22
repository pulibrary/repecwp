# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OmniauthCallbacksController do

  describe 'logging in' do
    context 'with a valid entra_id login' do
      let(:omniauth_response) { OmniAuth::AuthHash.new(provider: 'entra_id', extra: {raw_info: {email: 'someuid@princeton.edu'}}) }
      before { request.env['omniauth.auth'] = omniauth_response }

      context 'who is not already in the database' do
        it 'redirects to root and gives failure notice flash' do
          get :entra_id
          expect(response).to redirect_to(root_path)
          expect(flash.notice).to eq('You are not authorized to manage this application')
        end
      end
      context 'who is an admin in the database' do
        let!(:user) { FactoryBot.create(:princeton_admin) }
        before do
          allow(User).to receive(:from_omniauth).and_return(user)
        end
        it 'redirects to root and gives success notice flash' do
          get :entra_id
          expect(response).to redirect_to(root_path)
          expect(flash.notice).to eq('Successfully authenticated from your Princeton account.')
        end
        it 'sets the session' do
          get :entra_id
          expect(session['omniauth']).to eq({'provider' => 'entra_id', 'uid' => 'someuid'})
        end
        it 'clears anything that was previously in the session' do
          session['garbage'] = 'i should be removed'
          get :entra_id
          expect(session['garbage']).to be_nil
        end
      end
    end
  end
end
