class Poster < ApplicationRecord
  mount_uploader :image, ImageUploader
end
