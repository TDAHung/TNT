class Post < ApplicationRecord
  mount_uploaders :images, ImageUploader
end
