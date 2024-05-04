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
		while tomatoSeconds >= 0 do
			if tomatoSeconds == 0
				puts "End Pomodoro, break starting" 
				self.startBreak()
			elsif tomatoSeconds == oneTomato * 60
				puts "Start Pomodoro " + self.formatted_duration(tomatoSeconds)
			else
				puts self.formatted_duration(tomatoSeconds)
			end
			tomatoSeconds = tomatoSeconds - 1
			sleep 1
		end
	end
	def startBreak(oneBreak = 5)
		breakSeconds = oneBreak * 60
		while breakSeconds >= 0 do 
			if breakSeconds == 0
				puts "Congrats you finished! Run ruby index.rb to start again"
			else
				puts self.formatted_duration(breakSeconds)
			end
			breakSeconds = breakSeconds - 1
			sleep 1
		end
	end
end
puts "Enter minutes (Default is 25):"
tomato = gets.to_i
if tomato != 0 && tomato != nil
	TomatoTimer.new.startTimer(tomato)
else
	TomatoTimer.new.startTimer(25)
end