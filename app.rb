require_relative 'config/environment'

class App < Sinatra::Base

  

  get '/' do
    send_file '../public/index.html'
  end

end
