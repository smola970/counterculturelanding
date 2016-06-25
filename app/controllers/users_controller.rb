class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      cookies[:user_id] = { :value => user.id, :expires => 1.week.from_now }
      redirect_to reveal_path
    else
      render :new
    end
  end

  def update
    user = User.find(cookies[:user_id])
    user.feedback = params[:feedback]
    user.save
    render :json => user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :feedback)
  end

end