class PrivateController < ApplicationController
  layout 'base'
  before_filter :common_config

  def index
    if(current_user.login == params[:id])
      @clip = Clip.paginate(
        :page => params[:page],
        :per_page => @per_page,
        :order => "date DESC",
        :include => :user,
        :conditions => ["users.login=?", current_user.login]
      )
      render :action => 'myclip'
    else
      rescue_action_in_public
    end
  end

  def config
    if(current_user.login == params[:id])
      @user = User.find_by_login(current_user.login)
      render :action => 'myconf'
    else
      rescue_action_in_public
    end
  end

  def download
    if(current_user.login == params[:id])
      user = User.find_by_login(current_user.login)
      download = Download.new(user[:apikey])
      render :text => download.js
    end
  end
end
