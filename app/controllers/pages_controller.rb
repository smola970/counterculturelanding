class PagesController < ApplicationController

  def welcome
  end

  def landing
    @user = User.new
  end

  def feedback
    if cookies[:user_id] == nil
      redirect_to root_path
    else
      @user = User.find(cookies[:user_id])
    end
  end
end