# returns current temperature and condition for 35205
require '/home/ndfine/.conky_files/google_weather'

w = GoogleWeather.new
if w.errors?
  puts "??"
else
  puts "#{w.current_condition.upcase} | #{w.current_temp}°"
end
