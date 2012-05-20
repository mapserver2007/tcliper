module PrivateHelper
  def link_to_myclip
    link_to "マイクリップ", myclip_url(:id => h(current_user.login))
  end

  def link_to_myconf
    link_to "マイコンフィグ", myconf_url(:id => h(current_user.login))
  end

  def link_to_mygmdl
    link_to "UserScript Install", mygmdl_url(:id => h(current_user.login), :file => "tcliper.user.js")
  end

  def link_to_myaddondl
    link_to "Addon Install", 'http://summer-lights.dyndns.ws/tcliper_api/addon/release/tcliper-latest.xpi'
  end

  # コメント編集のテキストエリア
  def text_area_tag_comment(id, comment)
    text_area_tag("clip_info_comment_edit_ta_" + id.to_s, h(comment), :class => "clip_info_comment_edit_ta")
  end

end
