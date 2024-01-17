class Youth < ApplicationRecord
  mount_uploaders :pages, ComicUploader
end
