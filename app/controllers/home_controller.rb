class HomeController < ApplicationController
  before_action :reject_user,{only:[:top]}

  def top
    @contents = Post.all
    @contents_k = Post.page(params[:page]).per(5)
  end

  def post
    @contents = Post.new(
      content: params[:content],
      year: params[:y],
      manth: params[:m],
      day: params[:d],
      progress: params[:progress],
      creater: @current_user.name
    )
    if @contents.save 
      flash[:notice]="データを登録しました"
    else
      render 'top'
    end
    redirect_to("/home/top")
  end

  def delete
    del = Post.find(params[:id])
    del.destroy
    flash[:notice]="データを削除しました"
    redirect_to("/home/top")
  end

  def edit
    @edit = Post.find(params[:id])
  end

  def edit_save
    edit = Post.find(params[:id])
    edit.content = params[:content]
    edit.year = params[:y]
    edit.manth = params[:m]
    edit.day = params[:d]
    edit.progress = params[:progress]
    edit.creater = params[:create]
    edit.save
    flash[:notice] = "データを更新しました。"
    redirect_to("/home/top")
  end

end
