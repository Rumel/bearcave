class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  require 'themoviedb'

  before_filter :set_config
  Tmdb::Api.key(get_config("api.themoviedb"))

  def set_config
  	@configuration = Tmdb::configuration.new
  end

  def get_config(value)
  	file = File.open("./config/apikeys.config", 'r')
  	contents = file.read.split(/\n/)
  	config = {}
  	contents.each do |c|
  		split = c.split("=")
  		config[split[0]] = split[1]
  	end

  	return config[value]
  end
end
