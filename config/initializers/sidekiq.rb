redis_domain = ENV['REDIS_1_PORT_27017_TCP_ADDR']
redis_port   = ENV['REDIS_1_PORT_27017_TCP_PORT']

if redis_domain && redis_port
  redis_url = "redis://#{redis_domain}:#{redis_port}"

  Sidekiq.configure_server do |config|
    config.redis = { namespace: "sidekiq", url: redis_url, network_timeout: 5 }
  end

  Sidekiq.configure_client do |config|
    config.redis = { namespace: "sidekiq", url: redis_url, network_timeout: 5 }
  end

end
