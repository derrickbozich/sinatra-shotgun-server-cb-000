require_relative 'config/environment'
require 'json'
require 'rest-client'

class App < Sinatra::Base

  get '/' do
    send_file './public/index.html'
  end

  post '/search' do
    query = params['q']
    # nyt_api_key = 'a071bd4ce142480c84ce0f54bc695e09'
    # url = 'https://api.nytimes.com/svc/movies/v2/reviews/query=' + query +
    #  '&api-key=' + nyt_api_key
    # endpoint = 'https://api.nytimes.com/svc/movies/v2/reviews/'
    # 
    # 
    # res = Faraday.get endpoint do |req|
    #    req.params['api-key'] = nyt_api_key
    #    req.params['query'] = query
    #  end

    uri = URI("https://api.nytimes.com/svc/search/v2/articlesearch.json")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    uri.query = URI.encode_www_form({
      "api-key" => "a071bd4ce142480c84ce0f54bc695e09",
      "q" => query
    })
    request = Net::HTTP::Get.new(uri.request_uri)
    @result = JSON.parse(http.request(request).body)
    puts @result.inspect




    binding.pry
  end

end
