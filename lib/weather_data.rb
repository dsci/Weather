class WeatherData < Struct.new(:day_of_week,:low,:high, :icon, :condition)

  def method_missing(method_sym, *arguments, &block)
    begin
      return self.send(:to_c, method_sym.to_s.split("_").last.to_sym)
    rescue
      super
    end
  end

  private

  def to_c(attr)
    r = self.send(attr).to_f
    return (r - 32)/ 1.8
  end
end