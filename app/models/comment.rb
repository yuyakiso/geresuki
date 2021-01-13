class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gerende
  has_one_attached :image
  validates :text, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
