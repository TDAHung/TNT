class Yan < ApplicationRecord
  mount_uploaders :pages, ComicUploader
end
