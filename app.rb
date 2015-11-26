require 'sinatra'
require 'redis'

redis_domain = ENV['REDIS_PORT_6379_TCP_ADDR']
redis_port   = ENV['REDIS_PORT_6379_TCP_PORT']
redis_url = "redis://#{redis_domain}:#{redis_port}"

$redis = Redis.new(:url => redis_url)

get '/' do
  $redis.incr("counting").to_s
end