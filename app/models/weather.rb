class Weather

  def initialize(zip)
    @zip = zip
  end

  def get_humidity
    response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?zip=' + @zip + ',us&appid=3a1490b818a83773d784aed7d89a7440')
    return response
  end
end
