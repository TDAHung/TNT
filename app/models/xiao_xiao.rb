class XiaoXiao < ApplicationRecord
  mount_uploaders :pages, ComicUploader
  has_many :popcorns, as: :popcornable, dependent: :delete_all
end
