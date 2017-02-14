class Band < SimpleRecord::Base
#  belongs_to :user
#  belongs_to :city
#  belongs_to :genre
#  has_many :shows
#  has_many :members
#  
#  validates_presence_of :name, :user, :genre, :city

  has_strings :name, :email, :phone, :profile_image
  has_clobs :info
  has_ints :user_id, :city_id, :genre_id, :cover_type_cd
  has_booleans :verified
  
end

