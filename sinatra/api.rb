require 'sinatra/base'
require 'json'

class API < Sinatra::Base
  get '/sushi.json' do
    content_type :json
    return {:sushi => ["Maguro", "Hamachi", "Uni", "Saba", "Ebi", "Sake", "Tai"]}.to_json
  end
end
