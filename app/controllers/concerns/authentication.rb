# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    helper_method :current_user
    helper_method :user_signed_in?
  end

  def login(login_user)
    reset_session
    session[:current_user_id] = login_user.id
  end

  def logout
    reset_session
  end

  def redirect_if_authenticated
    redirect_to root_path, info: 'You are already logged in.' if user_signed_in?
  end

  private

  def current_user
    Current.login_user ||= session[:current_user_id] && LoginUser.find_by(id: session[:current_user_id])
  end

  def user_signed_in?
    Current.login_user.present?
  end
end
