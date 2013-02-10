# encoding: utf-8

require "./app"

class Rack::Protection::FrameOptions
  def header
    @header ||= {}
  end
end

set :environment, :production

run Sinatra::Application