env ='development'

DataMapper.setup(:default, "postgres://localhost/hair_now_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!


