require "rubygems"
require "bundler/setup"
Bundler.require(:default, :development)

require './lib/sinatra_continue_test'

class AlwaysRequestBody
  def initialize(app)
    @app = app
  end

  def call(env)
    if env["HTTP_EXPECT"] =~ /100-continue/
      [100, {}, [""]]
    else
      @app.call(env)
    end
  end
end

#use AlwaysRequestBody
run SinatraContinueTest
