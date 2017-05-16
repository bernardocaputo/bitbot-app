source :rubygems # repositório principal de gem.
gem 'sinatra'
gem "activerecord" # no rails ela já vem instalada
gem "sinatra-activerecord" # no rails ela já vem instalada
gem 'pg'
gem 'rake'

group :development do
 gem "tux" # é como se fosse o cmd rails c
end

group :test do
  gem "rack-test", require: "rack/test" #(entender pq tem que ter) middleware between http e framework
  gem "rspec"
end
