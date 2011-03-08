class GoogleWeatherFetcher
  
  class << self 
    def fetch(attr)
      url = URI.parse('http://www.google.com')
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.get("/ig/api?weather=#{attr}")
      }
      return res.body
    end
  end
end

#info = CollectWeather.run(:location => "04157")
#k = info.parse

#found = k.detect{|i| i.day_of_week.eql?(Date::ABBR_DAYNAMES[Time.now.wday])}

#puts "Minimal Temperatur: #{found.celsius_low}"
#puts "Maximal Temperatur: #{found.celsius_high}"

#puts found.celsius_medium => undefined method ‘celsius_medium’ for #<City:0x101816440>