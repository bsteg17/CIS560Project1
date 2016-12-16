class Store < ApplicationRecord
  self.primary_keys = :loc, :city_name
  has_many :items
end
