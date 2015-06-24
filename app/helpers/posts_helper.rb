module PostsHelper
  def get_countdown(post)
    countdown = post.destruct_at - Time.now
    hours_and_seconds = countdown.divmod(3600)
    minutes_and_seconds = hours_and_seconds[1].divmod(60)

    @hours = hours_and_seconds[0].to_s.rjust(2, '0')
    @minutes = minutes_and_seconds[0].to_s.rjust(2, '0')
    @seconds = minutes_and_seconds[1].to_i.to_s.rjust(2, '0')

    time_to_destruct = "#{@hours}:#{@minutes}:#{@seconds}"
    return time_to_destruct
  end
end
