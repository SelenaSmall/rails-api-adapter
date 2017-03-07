class UsersController < ApplicationController
  before_action :set_user, only: [:username, :password]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    git_data = GitAdapter.new(session[:username], session[:password])
    @data = git_data.user_info
    @repo = git_data.user_repo
  end

  def create
    @user = User.new(secure_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect_back(fallback_location: new_user_path,
                    alert: "Cannot create!
                    #{@user.errors.full_messages.join(', ')}")
    end
  end

  def destroy
    @_current_user = session[:current_user_id] = nil

    redirect_to new_user_path
  end

  private

  def secure_params
    params.require(:user).permit(:username, :password)
  end

end