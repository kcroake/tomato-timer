require 'sqlite3'

if File.file?("pomodoro-sessions.db")
	puts "Database Exists";
	db = SQLite3::Database.new "pomodoro-sessions.db"
	db.execute("select * from sessions") do |row|
		p row
	end
else
	db = SQLite3::Database.new "pomodoro-sessions.db"
	rows = db.execute <<-SQL
		create table sessions (
			SessionTitle varchar(55),
			SessionStart DATETIME,
			SessionEnd DATETIME,
			SessionDescription varchar(255),
			SessionCompleted boolean	
		);
	SQL
end

def write_session(title, start_time, end_time, description)
	db.execute("INSERT INTO sessions (SessionTitle, SessionStart, SessionEnd, SessionDescription, SessionCompleted)
	VALUES (?,?,?,?,?)",[@title, @start_time, @end_time, @description, true])	
end	