class User < ActiveRecord::Base
  has_many :posts
  
  before_save :default_values

  has_secure_password

  def default_values
    self.score ||= 0
    self.post_count ||= 0
  end
end
