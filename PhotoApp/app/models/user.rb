class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :tags, through: :posts
  has_many :locations, through: :posts
  
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" },
    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

def count_posts
   self.posts.length
 end

 def avg_likes_per_post
   sum = 0
   self.posts.each do |post|
     sum += post.count_likes
   end
   sum.to_f / self.count_posts
 end

 def count_posts_you_like
   sum = 0
   self.reviews.each do |review|
     if review.like
       sum += 1
     end
   end
   sum
 end

 def favorite_tag
   tags = self.posts.map {|post| post.tag.name }
   freq = tags.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
   fav_tag = tags.max_by { |v| freq[v] }
   if freq.values.count(freq[fav_tag]) > 1
     max = freq[fav_tag]
     favs = tags.select {|tag| freq[tag]==max}
     "##{favs.join(', #')}"
   else
     "##{fav_tag}"
   end
 end

 def favorite_location
   locations = self.posts.map {|post| post.location.name }
   freq = locations.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
   fav_location = locations.max_by { |v| freq[v] }
   if freq.values.count(freq[fav_location]) > 1
     max = freq[fav_location]
     favs = locations.select {|location| freq[location]==max}
     "#{favs.join(', ')}"
   else
     "#{fav_location}"
   end
 end

end
