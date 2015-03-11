require 'bcrypt'

class Client

  include DataMapper::Resource

  property :id,               Serial
  property :first_name,       String
  property :second_name,      String
  property :phone,            Text
  property :email,            String,  :unique => true, :message => "This email is already taken"
  property :password_digest,  Text

  has n, :appointments

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    client = first(:email => email)

    if client && BCrypt::Password.new(client.password_digest) == password
      client
    else
      nil
    end
  end

end