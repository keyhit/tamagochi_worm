require 'pry'
require 'erb'

require './app/controllers/worm_controller'
require './app/helpers/helper_worm'

class Application
  def self.call(env)
    req = Rack::Request.new(env)
    Worm.layout(req)
  end
end
