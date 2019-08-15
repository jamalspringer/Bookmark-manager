require 'uri'

my_possible_url = "http://www.google.com"

uri = URI.parse(my_possible_url)
if uri.kind_of?(URI::HTTP) or uri.kind_of?(URI::HTTPS)
  puts "great stuff"
else
  puts "didn't work"
end
