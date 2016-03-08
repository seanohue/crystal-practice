# Facebook-style timestamps
# If the difference between two timestamps is less then 5 seconds, return “Just moments ago”.
# If less than a minute, return “X seconds ago”.
# If less than an hour, return “X minutes ago”.

hours_ago = Time.now - 5.hour
minutes_ago = Time.now - 5.minute
seconds_ago = Time.now - 20.second
moments_ago = Time.now - 1.second

now = Time.now

timestamps = Set{hours_ago, minutes_ago, seconds_ago, moments_ago}

timestamps.each do |timestamp|
	span = now - timestamp
	if span < 5.second
		puts "Just moments ago."
	elsif span < 1.minute
		puts span.total_seconds.to_s + " seconds ago."
	elsif span < 1.hour
		puts span.total_minutes.to_s + " minutes ago."
	else span > 1.hour
		puts span.total_hours.to_s + " hours ago."
	end
end