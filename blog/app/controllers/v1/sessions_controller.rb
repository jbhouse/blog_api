class V1::SessionsController < ApplicationController
  def create
    user = User.where(email: params[:email]).first

    if user&.valid_password?(params[:password])
      # ^ this is shorthand for, if user & user.valid_password?
      render json: user.as_json(only: [:id, :email]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy

  end

end
