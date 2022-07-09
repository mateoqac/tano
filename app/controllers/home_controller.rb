# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def start_checking
    @checker = CitizenshipChecker.first || CitizenshipChecker.create!
  end

  def answer_no
    @checker = CitizenshipChecker.find(params[:id])

    @checker.no! unless CitizenshipChecker::FINAL_STATES.include?(@checker.question.to_sym)
    redirect_to start_checking_path
  end

  def answer_yes
    @checker = CitizenshipChecker.find(params[:id])
    @checker.yes! unless CitizenshipChecker::FINAL_STATES.include?(@checker.question.to_sym)
    redirect_to start_checking_path
  end

  def reset_form
    CitizenshipChecker.delete_all
  end
end
