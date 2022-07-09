# frozen_string_literal: true

class AdministrativeWorkflow < Workflow
  include AASM

  aasm.attribute_name :step_name
  STEP_WITH_MODEL_ASSOCIATED = [:build_folder].freeze

  aasm do
    state :build_folder, initial: true
    state :find_accomodation
    state :buy_ticket_and_insurance
    state :entry_to_europe_through_italy
    state :declaration_of_presence
    state :has_tax_code
    state :get_tax_code
  end

  private

  def set_defaults
    self.workflow_type = :administrative
  end
end
