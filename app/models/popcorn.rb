class Popcorn < ApplicationRecord
  belongs_to :popcornable, polymorphic: true
end
