class Rack::Attack
  throttle('requests by ip', limit: 5, period: 5) do |request|
    puts("request.ip: #{request.ip}")
    request.ip
  end
end

Rails.application.config.middleware.use Rack::Attack
