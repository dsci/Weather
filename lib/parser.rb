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
    data={:day_of_week=>"",:low=>"",:high=>"", :icon=>"", :condition=>"", :temp_c=>"", :humidity=>"", :wind_condition=>"" }
    xml.xpath("//forecast_conditions").first.children.each do |child|
      if(data.has_key?("#{child.name.to_s}".to_sym))
        data["#{child.name.to_s}".to_sym]=child['data']
      end
    end
    xml.xpath("//current_conditions").children.each do |child|
      if(data.has_key?("#{child.name.to_s}".to_sym))
        data["#{child.name.to_s}".to_sym]=child['data']
      end
    end
    return WeatherData.new(data)
  end

end