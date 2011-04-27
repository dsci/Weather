module WeatherHtmlHelper
  def box(location)
    info=Weather.run(:location=>location)
    k=info.parse
    s=%{
      <div style="border: thin solid black; width: 130px; height: 145px; margin: 50px; padding: 5px">
      <div align="center"><img src="http://www.google.com#{k.icon}" width="59" height="80"> </div></td></tr>
      <div align="center"> <small> #{location} </small></div></td></tr>
      <div align="center"> <b><big> #{k.temp_c}&#8451; </big> </b></div></td></tr>
      <div align="center">T:#{k.celsius_low.round}&#8451; | H:#{k.celsius_high.round}&#8451;</div></td></tr>
      </div>
      }
  end
end