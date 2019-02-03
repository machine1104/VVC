class Question < ApplicationRecord
  belongs_to :user
  belongs_to :announcement

  has_one :answer, dependent: :destroy

  validates :contenuto, presence: true
end
