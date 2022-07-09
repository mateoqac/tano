# frozen_string_literal: true

class CitizenshipChecker < ApplicationRecord
  include AASM

  FINAL_STATES = %i[judicial_way administrative_way marry_an_european get_a_lawyer].freeze
  aasm_column :question

  aasm do
    state :has_an_italian_ancestor, initial: true
    state :passed_before_1861
    state :was_born_on_the_austro_hungarian_empire
    state :was_born_or_emigrate_after_1920
    state :was_naturalized_before_the_child_was_born
    state :are_there_only_male_descendants
    state :was_the_descendant_of_the_first_woman_born_after_1948
    state :judicial_way
    state :administrative_way
    state :get_a_lawyer
    state :marry_an_european

    event :yes do
      transitions from: :has_an_italian_ancestor, to: :passed_before_1861
      transitions from: :passed_before_1861, to: :marry_an_european
      transitions from: :was_born_on_the_austro_hungarian_empire, to: :was_born_or_emigrate_after_1920
      transitions from: :was_born_or_emigrate_after_1920, to: :was_naturalized_before_the_child_was_born
      transitions from: :was_naturalized_before_the_child_was_born, to: :marry_an_european
      transitions from: :are_there_only_male_descendants, to: :administrative_way
      transitions from: :was_the_descendant_of_the_first_woman_born_after_1948, to: :administrative_way
    end

    event :no do
      transitions from: :has_an_italian_ancestor, to: :marry_an_european
      transitions from: :passed_before_1861, to: :was_born_on_the_austro_hungarian_empire
      transitions from: :was_born_or_emigrate_after_1920, to: :get_a_lawyer
      transitions from: :are_there_only_male_descendants, to: :was_the_descendant_of_the_first_woman_born_after_1948
      transitions from: :was_the_descendant_of_the_first_woman_born_after_1948, to: :judicial_way
      transitions from: :was_born_on_the_austro_hungarian_empire, to: :was_naturalized_before_the_child_was_born
      transitions from: :was_naturalized_before_the_child_was_born, to: :are_there_only_male_descendants
    end
  end

  def final_state?
    question.to_sym.in?(FINAL_STATES)
  end
end
