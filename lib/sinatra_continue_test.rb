require 'sinatra'

require 'sinatra/base'

class SinatraContinueTest < Sinatra::Base

  post "/foo" do
    status 200
    "There are #{params.length} params"
  end

end
