# frozen_string_literal: true

class LoginUserConfirmationsController < ApplicationController
  before_action :redirect_if_authenticated, only: %i[create new]

  def create
    @login_user = LoginUser.find_by(email: params[:login_user][:email].downcase)

    if @login_user.present? && @login_user.unconfirmed?
      @user.send_confirmation_email!
      redirect_to root_path, notice: 'Check your email for confirmation instructions.'
    else
      redirect_to new_login_user_confirmation_path,
                  alert: 'We could not find a user with that email or that email has already been confirmed.'
    end
  end

  def edit
    @login_user = LoginUser.find_signed(params[:confirmation_token], purpose: :confirm_email)

    if @login_user.present?
      @login_user.confirm!
      login @login_user
      redirect_to root_path, notice: 'Tu cuenta fue activada.'
    else
      redirect_to new_login_user_confirmation_path, alert: 'Su token expiro.'
    end
  end

  def new
    @user = User.new
  end
end
