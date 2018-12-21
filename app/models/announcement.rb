class Announcement < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :immagine_1, PictureUploader
  mount_uploader :immagine_2, PictureUploader
  mount_uploader :immagine_3, PictureUploader
  mount_uploader :immagine_4, PictureUploader
  mount_uploader :immagine_5, PictureUploader

  validates :user_id, presence: true
  validates :titolo, presence: true, length: { maximum: 50 }
  validates :descrizione, presence: true
  validates :categoria, presence: true
  validates :prezzo, presence: true
  validates :email, presence: true
end
