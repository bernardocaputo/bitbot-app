source :rubygems # repositorio principal de gem.
gem 'sinatra'
gem "activerecord" # no rails ela ja vem instalada
gem "sinatra-activerecord" # no rails ela ja vem instalada
gem 'pg'
gem 'rake'
gem 'pg_search'

group :development do
 gem "tux" # eh como se fosse o cmd rails c
end


group :test do
  gem "rack-test", require: "rack/test" #(entender pq tem que ter) middleware between http e framework
  gem "rspec"
  gem "factory_girl", "~> 4.0"
  gem "ffaker"
  gem 'database_cleaner'
end
