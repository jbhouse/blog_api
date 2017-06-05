class V1::SessionsController < ApplicationController
  def show
    current_user ? head(:ok) : head(:unauthorized)
    # this checks to see if the token in local storage is a valid token
  end

  def create
    @user = User.where(email: params[:email]).first

    if @user&.valid_password?(params[:password])
      # ^ this is shorthand for, if user & user.valid_password?
      render :create, status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
    if make_token_nill && current_user.save
      head (:ok)
    else
      head(:unauthorized)
    end
  end

  private

  def make_token_nill
    current_user&.authentication_token = nil
  end
end
