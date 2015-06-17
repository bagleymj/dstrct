class Post < ActiveRecord::Base
  belongs_to :user
  before_save :default_values

  def default_values
    self.score ||= 0
  end

  def reset_score
    self.score = 0
    self.save
  end
end
