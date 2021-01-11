class Gerende < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :prefecture_id
  end

  def self.search(search)
    if search != ""
      Gerende.where('name LIKE(?)', "%#{search[:keyword]}%")
    else
      Gerende.all
    end
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
