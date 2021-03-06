class User < ActiveRecord::Base
  has_many :posts
  
  before_save :default_values

  has_secure_password

  def default_values
    self.score ||= 0
    self.post_count ||= 0
  end

  def update_post_count
    count = 0
    self.posts.each do |post|
      count += 1
    end
    self.post_count = count
    self.save
  end

  def reset_score
    self.score = 0
    self.save
  end
end
