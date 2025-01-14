require 'redis/namespace'

redis_config = if ENV['REDIS_PORT_6379_TCP_PORT']
                 {
                   url: "redis://#{ENV['REDIS_PORT_6379_TCP_ADDR']}:#{ENV['REDIS_PORT_6379_TCP_PORT']}/0",
                   namespace: "filter_#{Rails.env}"
                 }
               else
                 {
                   url: 'redis://localhost:6379/1',
                   namespace: "filter_#{Rails.env}"
                 }
               end

Redis::Namespace::COMMANDS['lock'] = [:all]
Redis::Namespace::COMMANDS['unlock'] = [:all]
Sidekiq.configure_client do |config|
  config.redis = redis_config
  # ActiveRecord::Base.establish_connection
end
Sidekiq.configure_server do |config|
  config.redis = redis_config
end
if Rails.env.production?
  Sidekiq::Logging.logger = Rails.logger
end
Sidekiq.default_worker_options = { retry: 1 }

require 'sidekiq/web'
Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]
