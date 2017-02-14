class Member < ActiveRecord::Base
  belongs_to :band
  belongs_to :venue
  belongs_to :service
end