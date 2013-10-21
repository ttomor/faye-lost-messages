class ApplicationController < ActionController::Base
  protect_from_forgery

  def client
  end

  def server

  end

  def inc
  	broadcast('/counter', params[:value])

  	render :nothing=>true
  end

  def broadcast(channel, object)
    message = {:channel => channel, :data => {:object => object, :type => "message"}}
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end


end
