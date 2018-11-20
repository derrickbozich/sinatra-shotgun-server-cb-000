require_relative 'config/environment'
require 'json'
require 'rest-client'

class App < Sinatra::Base

  get '/' do
    send_file './public/index.html'
  end

  post '/search' do
    query = params['q']
    nyt_api_key = 'f98593a095b44546bf4073744b540da0'
    url = 'https://api.nytimes.com/svc/movies/v2/reviews/query=' + query +
     '&api-key=' + nyt_api_key
    endpoint = 'https://api.nytimes.com/svc/movies/v2/reviews/'

    
    res = Faraday.get endpoint do |req|
       req.params['api-key'] = nyt_api_key
       req.params['query'] = query
     end




    binding.pry
  end

end
