class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      format.js
      render 'new'
    else
      format.js
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :gender)
  end
end
