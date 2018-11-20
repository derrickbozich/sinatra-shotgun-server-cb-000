require_relative 'config/environment'

class App < Sinatra::Base

  # get '/' do
  #   "Started my server using edit Shotgun! edit"
  # end

  get '/' do
    send_file './public/index.html'
  end

  post '/search' do
    binding.pry
  end

end
