require_relative 'config/environment'
require 'json'

class App < Sinatra::Base

  get '/' do
    send_file './public/index.html'
  end

  post '/search' do
    # query = params['q']
    # nyt_api_key = 'f98593a095b44546bf4073744b540da0'
    # url = 'https://api.nytimes.com/svc/movies/v2/reviews/query=' + query +
    #  '&api-key=' + nyt_api_key
    #
    # res = Faraday.get url do |req|
    #    #  req.params['api-key'] = nyt_api_key
    #    # req.params['client_secret'] = client_secret
    #    # req.params['v'] = '20160201'
    #    # req.params['near'] = params[:zipcode]
    #    # req.params['query'] = 'coffee shop'
    #    req.response :json
    #  end
  

    url = 'https://api.spotify.com/v1/search?type=artist&q=tycho'
    response = RestClient.get(url)
    JSON.parse(response)



     binding.pry
  end

end
