class Post < ApplicationRecord
  belongs_to :user
  belongs_to :tag
  belongs_to :location
  has_many :reviews
  has_attached_file :post_img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :post_img, content_type: /\Aimage\/.*\z/

  def count_likes
    self.reviews
  end
end
