require 'sqlite3'
db = SQLite3::Database.open 'pomodoro-sessions.db'
db.execute "CREATE TABLE IF NOT EXISTS 	sessions(title TEXT, sessionstart TEXT, sessionend TEXT)"

db.execute "INSERT INTO sessions (title, sessionstart, sessionend)"


# if File.file?("pomodoro-sessions.db")
# 	puts "Database Exists";
# 	db = SQLite3::Database.new "pomodoro-sessions.db"
# 	db.execute("select * from sessions") do |row|
# 		p row
# 	end
# else
# 	db = SQLite3::Database.open "pomodoro-sessions.db"
# 	rows = db.execute <<-SQL
# 		create table sessions (
# 			title varchar(55),
# 			sessionstart varchar(55),
# 			sessionend varchar(55,
# 			sessiondescription varchar(255)
# 		);
# 	SQL
# end

# def write_session(db,title, start_time, end_time, description)
# 	db.execute("INSERT INTO sessions (title, sessionstart, sessionend, sessiondescription)
# 	VALUES (?,?,?,?,?)",[title, start_time, end_time, description])	
# end	

# write_session(db, 'My Title', 'test' , 'test', 'test')