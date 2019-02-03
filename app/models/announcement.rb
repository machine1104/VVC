class Announcement < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  

  scope :favorited_by, -> (username) { joins(:favorites).where(favorites: { user: User.where(username: username) }) }

  default_scope -> { order(created_at: :desc) }

  mount_uploader :immagine_1, PictureUploader
  mount_uploader :immagine_2, PictureUploader
  mount_uploader :immagine_3, PictureUploader
  mount_uploader :immagine_4, PictureUploader
  mount_uploader :immagine_5, PictureUploader

  validates :titolo, presence: true, length: { maximum: 50 }
  validates :descrizione, presence: true
  validates :categoria, presence: true
  validates :prezzo, presence: true
  validates :email, presence: true

  def self.filter(prezzo, regione, categoria)
    return scoped unless prezzo.present? || regione.present? || categoria.present?
      where(['regione LIKE ? AND categoria LIKE ?', "%#{regione}%", "%#{categoria}%"]).reorder('prezzo ' + prezzo)
  end
end
