require 'dm-serializer'

class Appointment

  include DataMapper::Resource

  property :id,              Serial
  property :start_time,      String
  property :start,            Date

  belongs_to :client

end

