# returns count of my gmail inbox unread

require 'rubygems'
require 'httparty'

class Gmail
  include HTTParty
  base_uri 'https://mail.google.com'

  def self.inbox(user, pass)
    get('/mail/feed/atom', :basic_auth => { :username => user, :password => pass })["feed"]["entry"]
  end

end

eeeemells = Gmail.inbox('foobar','foobar')

if eeeemells.is_a?(Hash)
  x = 1
elsif eeeemells.is_a?(Array)
  x = eeeemells.size
else
  x = 0
end

puts "MAIL | #{x}"
