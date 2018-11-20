require_relative 'config/environment'
require 'json'
require 'rest-client'

class App < Sinatra::Base

  get '/' do
    send_file './public/index.html'
  end

  post '/search' do
    query = params['q']
    nyt_api_key = 'a071bd4ce142480c84ce0f54bc695e09'
    endpoint = 'https://api.nytimes.com/svc/search/v2/articlesearch.json'


    res = Faraday.get endpoint do |req|
       req.params['api-key'] = nyt_api_key
       req.params['q'] = query
     end
     binding.pry

    # uri = URI("https://api.nytimes.com/svc/search/v2/articlesearch.json")
    # http = Net::HTTP.new(uri.host, uri.port)
    # http.use_ssl = true
    # uri.query = URI.encode_www_form({
    #   "api-key" => "a071bd4ce142480c84ce0f54bc695e09",
    #   "q" => query
    # })
    # request = Net::HTTP::Get.new(uri.request_uri)
    # @result = JSON.parse(http.request(request).body)
    # binding.pry
    # puts @result.inspect





  end

end
