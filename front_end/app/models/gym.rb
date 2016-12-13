class Gym < ApplicationRecord
  self.primary_keys = :num, :city_name
  has_many :trainers
end
