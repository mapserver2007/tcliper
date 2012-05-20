require 'digest/sha2'
require 'date'
class ClipsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    clip = Clip.new
    # POST parameters
    if request.post?
      clip.user_id  = User.find_by_apikey(params[:apikey])[:id] rescue nil
      clip.title    = params[:title]
      clip.url      = params[:url]
      clip.url_hash = Digest::SHA256.hexdigest("--#{params[:apikey]}--#{params[:url]}") if params[:url]
      clip.comment  = params[:comment]
      clip.date     = DateTime.now.to_time
      clip.public   = params[:public]
    end

    unless clip.save
      err_msg = []
      clip.errors.each do |attr, error| err_msg << error.to_s end
      render :text => err_msg.join("\n")
    else
      render :text => "clip complete!"
    end
  end
end
