Rails.application.routes.draw do
  resources :archives
  resources :series
  resources :papers
  root 'series#index'
  # hack to serve up archive and series index files at old URLs
  get 'priseri', to: 'series#index', format: true
  get 'priarch', to: 'archives#index', format: true

  connection = ActiveRecord::Base.connection.nil? rescue nil 
  unless connection.nil?
    # Preserve legacy path to series rdf
    if ActiveRecord::Base.connection.table_exists?(:series)
      Series.find_each do |ser|
        get "#{ser.pri_handle}/#{ser.pri_handle}", to: 'series#show', id: ser.id, format: true
      end
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }, skip: [:passwords, :registration]
  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
    get 'users/auth/cas', to: 'users/omniauth_authorize#passthru', defaults: { provider: :cas }, as: "new_user_session"
  end

  mount HealthMonitor::Engine => '/'
end

