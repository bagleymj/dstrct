module PostsHelper
  def humanize(countdown)
    hours_and_seconds = countdown.divmon(3600)
    minutes_and_seconds = hours_and_seconds.divmon(60)
    @hours = hours_and_seconds[0]
    @minutes = minutes_and_seconds[0]
    @seconds = minutes_and_seconds[1]
  end
end
