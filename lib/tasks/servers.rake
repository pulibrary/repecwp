namespace :servers do
    desc "Start solr and postgres servers using lando."
    task :start do
      system("lando start")
      system("rake db:create")
      system("rake db:migrate")
      system("rake db:migrate RAILS_ENV=test")
    end
  end