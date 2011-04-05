module Helper
  def box(location)
    info=Weather.run(:location=>location)
    k=info.parse
    found=k.detect{|i| i.day_of_week.eql?(Date::ABBR_DAYNAMES[Time.now.wday])} 
    result={:temp_low=>found.celsius_low, :temp_high=>found.celsius_high, :temp_c=>k.last.temp_c, :image=>k.last.icon} 
    s=%{
      <table style="border: solid black">
        <tr><td><div align="center"><img src="http://www.google.com#{result[:image]}" width="59" height="80"> </div></td></tr>
        <tr><td><div align="center"> <small>#{location}  </small></div></td></tr>
        <tr><td><div align="center"> <b><big> #{result[:temp_c].to_i}&#8451; </big> </b></div></td></tr>
        <tr><td><div align="center">T:#{result[:temp_low].to_i}&#8451; | H:#{result[:temp_high].to_i}&#8451;</div></td></tr>
      </table>
      }
  end
end