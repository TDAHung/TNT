class Angel < ApplicationRecord
  mount_uploaders :pages, ComicUploader
end
