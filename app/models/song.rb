class Song < ActiveRecord::Base

  validates :title, :author, :url, presence: true

end