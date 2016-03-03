class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @age = age(@user.date_of_birth)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def age(dob)
    return nil unless dob
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name,
                                 :telephone, :city, :country, :address,
                                 :gender, :date_of_birth, :occupation, :about)
  end
end
