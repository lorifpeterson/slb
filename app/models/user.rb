class User < ActiveRecord::Base
  has_one :band
  has_one :venue
  has_one :service
  
  validates_uniqueness_of :username
  
  def password=(pass)
    salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp
    self.password_salt, self.password_hash = salt, Digest::SHA256.hexdigest(pass + salt)
  end
  
  def self.authenticate(username, password)
    user = User.find(:first, :conditions=>['username = ?', username])
    
    if user.blank? || Digest::SHA256.hexdigest(password + user.password_salt) != user.password_hash
      raise "Username and password do not match"
    end
    user
  end
end