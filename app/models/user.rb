class User < ActiveRecord::Base

  has_many :songs

  validates :username, :email, presence: true, uniqueness: true
  validates :password, presence: true

end