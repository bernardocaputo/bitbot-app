configure :test do
   set :database, {
     adapter: 'postgresql',
     encoding: 'utf8',
     database: 'bitbot_test',
     pool: 5,
     username: 'postgres',
     host: 'postgres'  # host criado pelo docker para network dos containers
   }
end

configure :development do
 set :database, {
   adapter: 'postgresql',
   encoding: 'utf8',
   database: 'bitbot_development',
   pool: 5,
   username: 'postgres',
   host: 'postgres'  # host criado pelo docker para network dos containers
 }
end

configure :production do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///postgres/bitbot_production')

  set :database, {
    adapter:  db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    host:     db.host,
    username: db.user,
    password: db.password,
    database: db.path[1..-1],
    encoding: 'utf8'
  }

end
