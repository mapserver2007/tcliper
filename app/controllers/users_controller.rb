class UsersController < ApplicationController
  layout 'base'
  before_filter :common_config

  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default(@doc_root)
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

end
