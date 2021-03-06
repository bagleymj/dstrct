class Post < ActiveRecord::Base
  belongs_to :user
  before_save :default_values

  def default_values
    self.score ||= 0
    if self.lifespan = nil
      new_record?
    end
    self.lifespan ||= 3600
    self.destruct_at = self.lifespan.seconds.from_now if new_record?
  end

  def reset_score
    self.score = 0
    self.save
  end

  def is_not_destructed?
    Time.now < self.destruct_at
  end

end
