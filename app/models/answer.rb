class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :announcement
  belongs_to :question

  validates :contenuto, presence: true
end
