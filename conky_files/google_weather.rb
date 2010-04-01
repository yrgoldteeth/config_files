require 'rubygems'
require 'active_support'
require 'open-uri'

class GoogleWeather
  WEATHER_URL = "http://www.google.com/ig/api?weather=35205"

  attr_accessor :weather_information

  def initialize(url=WEATHER_URL)
    weather_hash = Hash.from_xml(open(WEATHER_URL).read)
    self.weather_information = weather_hash["xml_api_reply"]["weather"]
  end

  def errors?
    weather_information["problem_cause"].present?
  end
 
  def current_condition
    weather_information["current_conditions"]["condition"]["data"]
  end

  def current_temp
    weather_information["current_conditions"]["temp_f"]["data"]
  end

  def forecast
    weather_information["forecast_conditions"]
  end
end
