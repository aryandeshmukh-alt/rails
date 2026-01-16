class Blog < ApplicationRecord
  has_many :comments, dependent: :destroy

  scope :published, -> { where(published: true) }

  validates :title, presence: true
  validates :body, presence: true
end
