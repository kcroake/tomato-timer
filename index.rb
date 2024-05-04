class TomatoTimer
	def initialize
		@startTime = Time.now
	end	
	def formatted_duration(total_seconds)
	  total_seconds = total_seconds.round # to avoid fractional seconds potentially compounding and messing up seconds, minutes and hours
	  hours = total_seconds / (60*60)
	  minutes = (total_seconds / 60) % 60 # the modulo operator (%) gives the remainder when leftside is divided by rightside. Ex: 121 % 60 = 1
	  seconds = total_seconds % 60
	  [hours, minutes, seconds].map do |t|
		# Right justify and pad with 0 until length is 2. 
		# So if the duration of any of the time components is 0, then it will display as 00
		t.round.to_s.rjust(2,'0')
	  end.join(':')
	end
	def startTimer(oneTomato = 25)
		tomatoSeconds = oneTomato * 60 ## Replace 5 with 60 for seconds in a minute
		while tomatoSeconds >= 1 do
			if tomatoSeconds == 0
				puts "End Pomodoro, take break? (5:00)" 
			elsif tomatoSeconds == oneTomato * 60
				puts "Start Pomodoro" + self.formatted_duration(tomatoSeconds)
			else
				puts self.formatted_duration(tomatoSeconds)
			end
			tomatoSeconds = tomatoSeconds - 1
			sleep 1
		end
	end
end

tomato = gets.to_i ? gets.to_i : 25

if tomato != 0
	TomatoTimer.new.startTimer(tomato)
end