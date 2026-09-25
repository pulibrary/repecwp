def sign_in(user)
    allow_any_instance_of(ApplicationController).to receive(:session).and_return(
        {omniauth: OmniAuth::AuthHash.new('uid': user.uid, provider: 'cas')}
    )
end
