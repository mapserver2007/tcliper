class TcliperController < ApplicationController
  layout 'base'
  before_filter :common_config

  STATUS_SUCCESS = "success"

  # 初期画面
  def index
    # Clipデータを取得
    @clip = Clip.paginate(
      :page => params[:page],
      :conditions => {:public => 1},
      :order => "date DESC",
      :per_page => @per_page,
      :include => :user
    )
    render :action => 'index'
  end

  # コメント編集
  def edit
    # Clipコメントを更新
    Clip.update(params[:id], :comment => params[:comment])
    render :text => {
      :id => params[:id],
      :comment => params[:comment],
      :status => STATUS_SUCCESS
    }.to_json
  end

end
