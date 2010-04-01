require '/home/foobar/.conky_files/google_weather'

w = GoogleWeather.new
w.forecast.each do |f|
  day = f["day_of_week"]["data"]
  high = f["high"]["data"]
  low = f["low"]["data"]
  condition = f["condition"]["data"]
  
  puts "#{day} | H #{high}° | L #{low}° | #{condition}"
end
