class Song < ActiveRecord::Base

  belongs_to :user

  validates :title, :author, :url, presence: true

end