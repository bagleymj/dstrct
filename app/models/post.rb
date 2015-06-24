class Post < ActiveRecord::Base
  belongs_to :user
  before_save :default_values

  def default_values
    self.score ||= 0
    default_lifespan = 3600
    self.lifespan = default_lifespan
    self.destruct_at = default_lifespan.seconds.from_now
  end

  def reset_score
    self.score = 0
    self.save
  end
end
