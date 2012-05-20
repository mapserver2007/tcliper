module TcliperLivedoorauth
  LIVEDOOR_AUTH_APPKEY = '7c5ecc2f17cd169214b3d040db3a32df'
  LIVEDOOR_AUTH_SECRET = '5ba571b3f84ed6f7'
  AUTH = Livedoor::API::Auth.new(:app_key => LIVEDOOR_AUTH_APPKEY, :secret => LIVEDOOR_AUTH_SECRET)

  def authenticate
    if logged_in?
      return true
    else
      u = AUTH.uri_to_login(:userdata => request.request_uri)
      redirect_to u.to_s
      return false
    end
  end

  def validate_auth
    user = AUTH.validate_response(request.query_string)
    login(user[:userhash])
    redirect_to user[:userdata] unless user[:userdata].blank?
    user
  end

  def logged_in?
    !! session[:userhash]
  end

  def login(hash)
    request.reset_session
    request.session[:userhash] = hash
  end

  def userhash
    session[:userhash]
  end
end