# config/initializers/rack_attack.rb
Rack::Attack.throttle('req/ip', limit: 1000, period: 1.hour) do |req|
  req.ip
end