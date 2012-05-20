module SessionsHelper
  # ログインへのリンク
  def link_to_tcliper_login
    link_to "Login", login_url
  end

  # ログアウトへのリンク
  def link_to_tcliper_logout
    link_to "Logout", logout_url
  end
end