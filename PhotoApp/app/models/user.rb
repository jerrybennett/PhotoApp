class User < ApplicationRecord
  has_many :posts
  has_many :reviews
  has_many :tags, through: :posts
  has_many :locations, through: :posts
end
