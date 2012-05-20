module TcliperHelper

  # サムネイル画像のリンク
  def link_to_thumnail(title, url)
    thumnail_url = "http://capture.heartrails.com/small?"
    link_to image_tag(thumnail_url + url, :size => "80x60", :alt => h(title)), url
  end

  # タイトルのリンク
  def link_to_title(title, url)
    link_to title, url
  end

  # プライベートページへのリンク
  def link_to_private_page
    link_to "Private", myclip_url(h(current_user.login))
  end
end
