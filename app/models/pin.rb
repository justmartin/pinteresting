class Pin < ApplicationRecord
  belongs_to :user
  
  has_attached_file :image, styles: { xx_large: "900x900>", x_large: "700x700>", large: "500x500>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :description, presence: true
  validates :image, presence: true
end
