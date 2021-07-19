class UserController < ApplicationController
    before_action :accept_user,{only:[:login_form]}

    def login_form
    end

    def edit
        @users = User.all
    end

    def login
        @user = User.find_by(
            email: params[:email],
            password: params[:password]
        )
        if @user
            session[:user_id] = @user.id
            flash[:notice]="ログインしました"
            redirect_to("/home/top")
        else
            flash[:notice]="ユーザー名、またはパスワードが間違っています。"
            render("login_form")
        end
    end

    def logout
        session[:user_id] = nil
        flash[:notice]="ログアウトしました"
        redirect_to("/login")
    end

    def new

    end

    def create
        @user = User.new(
            name: params[:name],
            email: params[:email],
            password: params[:password]
        )
        if @user.save 
            flash[:notice]="新規ユーザーを登録しました"
            redirect_to("/login")
        else
            flash[:notice]="新規ユーザー登録に失敗しました"
            render 'user_new'
        end
    end

    def edit_form
        @user = User.find_by(id: params[:id])
    end

    def delete
        @user = User.find_by(id: params[:id])
        @user.destroy
        flash[:notice] ="ユーザーを消去しました"
        redirect_to("/user/edit")
    end

    def save
        user = User.find_by(id: params[:id])
        user.email = params[:email]
        user.name = params[:name]
        user.password = params[:password]
        user.admin = params[:admin]
        user.save
        flash[:notice]="ユーザーを編集しました"
        redirect_to("/user/edit")
    end
end
