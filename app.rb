require_relative 'config/environment'


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
     @result = JSON.parse(res.body)
     binding.pry

  





  end

end
