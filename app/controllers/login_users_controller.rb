# frozen_string_literal: true

# frozen_string_literal: true

class LoginUsersController < ApplicationController
  before_action :redirect_if_authenticated, only: %i[create new]

  def create
    @login_user = LoginUser.new(login_user_params)
    if @login_user.save
      @login_user.send_confirmation_email!

      redirect_to root_path, info: 'Por favor, siga las instrucciones enviadas por email para confirmar su cuenta.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @login_user = LoginUser.new
  end

  private

  def login_user_params
    params.require(:login_user).permit(:email, :password, :password_confirmation, :state)
  end
end
