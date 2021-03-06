namespace :deploy do
  task :upload_site do
    run_locally do
      execute 'bundle exec jekyll build'
    end
    on roles(:all) do
      upload! '_site/', '/home/www/1911', recursive: true
    end
    on roles(:all) do
      execute "chown -R deploy:www-data #{deploy_path}/_site"
    end
  end
end
