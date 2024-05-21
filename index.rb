class TomatoTimer
	def initialize()
		@start_time = Time.now
	end	
	
	def formatted_duration(total_seconds)
	  total_seconds = total_seconds.round 
	  hours = total_seconds / (60*60)
	  minutes = (total_seconds / 60) % 60
	  seconds = total_seconds % 60
	  [hours, minutes, seconds].map do |t|
		t.round.to_s.rjust(2,'0')
	  end.join(':')
	end
	
	def start_timer()
		puts "Start Pomodoro? yes or no?"
		start = gets.to_s.chomp
		case start
			when "yes"
				one_tomato = 25 #update to 25
				tomato_seconds = one_tomato * 60 ## Replace 5 with 60 for seconds in a minute
				while tomato_seconds >= 0 do
					if tomato_seconds == 0
						puts "End Pomodoro, break starting" 
						self.start_break()
					elsif tomato_seconds == one_tomato * 60
						puts "Start Pomodoro " + self.formatted_duration(tomato_seconds)
					else
						puts self.formatted_duration(tomato_seconds)
					end
					tomato_seconds = tomato_seconds - 1
					sleep 1
				end
			when "no"
				puts "ok maybe another time"
			else
				puts "invalid answer, yes or no"
		end
	end
	
	def start_break()
		one_break = 5 # update to 5
		puts "Start Break?"
		bool = gets.to_s.chomp
		case bool
			when 'no'
				puts 'Stop Pomodoro'
			when 'yes'
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
			else 
				puts 'Invalid answer, yes or no'
		end
	end
end
##TomatoTimer.new.start_timer
# puts "Enter minutes (Default is 25):"
# tomato = gets.to_i
# if tomato != 0 && tomato != nil
# 	TomatoTimer.new.start_timer(tomato)
# else
# 	TomatoTimer.new.start_timer(25)
# end