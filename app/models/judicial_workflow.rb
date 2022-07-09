# frozen_string_literal: true

class JudicialWorkflow < Workflow
  include AASM

  aasm.attribute_name :step_name

  FINAL_STATES = [:full_italian].freeze

  aasm do
    state :build_folder, initial: true
    state :checking_paperwork
    state :sign_power_of_attorney_and_send_folder
    state :presentation_folder_in_courts
    state :judge_assignment
    state :get_appointment
    state :get_the_recognition
    state :request_transcript_birth_certificate
    state :communication_between_municipality_and_consulate
    state :AIRE_registration
    state :request_passport
    state :full_italian

    event :next do
      transitions from: :build_folder, to: :checking_paperwork
      transitions from: :checking_paperwork, to: :sign_power_of_attorney_and_send_folder
      transitions from: :sign_power_of_attorney_and_send_folder, to: :presentation_folder_in_courts
      transitions from: :presentation_folder_in_courts, to: :judge_assignment
      transitions from: :judge_assignment, to: :get_appointment
      transitions from: :get_appointment, to: :get_the_recognition
      transitions from: :get_the_recognition, to: :request_transcript_birth_certificate
      transitions from: :request_transcript_birth_certificate, to: :communication_between_municipality_and_consulate
      transitions from: :communication_between_municipality_and_consulate, to: :AIRE_registration
      transitions from: :AIRE_registration, to: :request_passport
      transitions from: :request_passport, to: :full_italian
    end
  end

  private

  def set_defaults
    self.workflow_type = :judicial
  end
end
