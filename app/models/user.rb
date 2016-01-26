class User < ActiveRecord::Base

  validates :username, :email, presence: true, uniqueness: true
  validates :password, presence: true

end