class Weather < Struct.new(:location,:data)

  class << self

    def run(opt={})
      klass = self.new
      klass.location = opt[:location]
      return klass
    end

  end

  def parse
    xml = Nokogiri::XML(GoogleWeatherFetcher.fetch(location))
    data = []
    xml.xpath("//forecast_conditions").each do |inf|
      c = WeatherData.new
      inf.children.each do |child|
        #puts "#{child.name}/#{child['data']}"
        c.send("#{child.name.to_s}=",child['data'])
      end
      data << c
    end
    return data
  end

end