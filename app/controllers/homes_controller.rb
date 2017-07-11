class HomesController < ApplicationController

  def index
    
  end

  def test

    call_info = params['testy']


    if call_info
      p call_info['zip']
      zip_from_form = call_info['zip']
      weather_object = Weather.new(zip_from_form)
      @humidity = weather_object.get_humidity()
    end

  end
end
