env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://user:password/hair_now_#{env}")

require './lib/link'

DataMapper.finalize

DataMapper.auto_upgrade!
