class Venue < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  has_many :shows
end