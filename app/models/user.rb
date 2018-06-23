class User < ActiveRecord::Base
  validates_presence_of :name, :email, :password_digest
  has_many :tweets
end
