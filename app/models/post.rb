class Post < ApplicationRecord
  mount_uploaders :images, ImageUploader
  has_many :popcorns, as: :popcornable, dependent: :delete_all
end
