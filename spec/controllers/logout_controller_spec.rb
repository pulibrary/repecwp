# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LogoutController do
  it 'clears the session' do
    session['garbage'] = 'please remove me'
    session['omniauth'] = {uid: 'old', provide: 'not needed any more'}

    get :logout

    expect(session['garbage']).to be_blank
    expect(session['omniauth']).to be_blank
  end
end
