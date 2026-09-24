Rails.application.routes.draw do
  resources :archives
  resources :series
  resources :papers
  root 'series#index'
  # hack to serve up archive and series index files at old URLs
  get 'priseri', to: 'series#index', format: true
  get 'priarch', to: 'archives#index', format: true
  get 'auth/cas/callback', to: 'omniauth_callbacks#cas'
  get 'logout', to: 'logout#logout'

  connection = ActiveRecord::Base.connection.nil? rescue nil 
  unless connection.nil?
    # Preserve legacy path to series rdf
    if ActiveRecord::Base.connection.table_exists?(:series)
      Series.find_each do |ser|
        get "#{ser.pri_handle}/#{ser.pri_handle}", to: 'series#show', id: ser.id, format: true
      end
    end
  end

  mount HealthMonitor::Engine => '/'
end

