require 'json'
class TomatoTimer
	def initialize
		@start_time = Time.now
		@tomato_session = {}
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
	def write_jason()
		File.write('recent-sessions.json', 'Data', mode: 'a')
		#write local json file to store sessions
	end
	def start_timer(one_tomato = 25)
		tomato_seconds = one_tomato * 60 ## Replace 5 with 60 for seconds in a minute
		while tomato_seconds >= 0 do
			if tomato_seconds == 0
				puts "End Pomodoro, break starting" 
				##self.start_break()
			elsif tomato_seconds == one_tomato * 60
				puts "Start Pomodoro " + self.formatted_duration(tomato_seconds)
			else
				puts self.formatted_duration(tomato_seconds)
			end
			tomato_seconds = tomato_seconds - 1
			sleep 1
		end
	end
	def start_break(one_break = 5)
		break_seconds = one_break * 60
		while break_seconds >= 0 do 
			if break_seconds == 0
				puts "Congrats you finished! Run ruby index.rb to start again"
			else
				puts self.formatted_duration(break_seconds)
			end
			break_seconds = break_seconds - 1
			sleep 1
		end
	end
	
end
TomatoTimer.new.write_jason();
# puts "Enter minutes (Default is 25):"
# tomato = gets.to_i
# if tomato != 0 && tomato != nil
# 	TomatoTimer.new.start_timer(tomato)
# else
# 	TomatoTimer.new.start_timer(25)
# end