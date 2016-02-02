class Time
  def self.elapsed time
    @elapsed = self.now - time
    @when = if @elapsed < 60
      [@elapsed.to_i, "second"]
    elsif @elapsed < 60 * 60
      [(@elapsed / 60).to_i, "minute"]
    elsif @elapsed < 60 * 60 * 60
      [(@elapsed / 60 / 60).to_i, "hour"]
    elsif @elapsed < 60 * 60 * 60 * 24
      [(@elapsed / 60 / 60 / 24).to_i, "day"]
    elsif @elapsed < 60 * 60 * 60 * 24 * 7
      [(@elapsed / 60 / 60 / 24 / 7).to_i, "week"]
    elsif @elapsed < 60 * 60 * 60 * 24 * 30
      [(@elapsed / 60 / 60 / 24 / 30).to_i, "month"]
    else
      [(@elapsed / 60 / 60 / 24 / 365).to_i, "year"]
    end
    @when[1] += "s" if @when[0] > 1
    "#{@when[0]} #{@when[1]} ago"
  end
end