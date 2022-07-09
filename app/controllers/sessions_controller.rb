# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: %i[create new]

  def create
    redirect_to new_login_user_confirmation_path, alert: 'Incorrect email or password.' if login_user.unconfirmed?
    if login_user.authenticate(params[:login_user][:password])
      login login_user
      redirect_to root_path, notice: 'Signed in.'
    else
      show_alert_and_render_new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Signed out.'
  end

  def new; end

  private

  def login_user
    @login_user ||= LoginUser.find_by(email: params[:login_user][:email].downcase)

    return @login_user if @login_user.present?

    show_alert_and_render_new
  end

  def show_alert_and_render_new
    flash.now[:alert] = 'Incorrect email or password.'
    render :new, status: :unprocessable_entity
  end
end
