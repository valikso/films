class Film < ApplicationRecord
  mount_uploader :logo, LogoUploader
  has_many :film_comments, dependent: :destroy
end
