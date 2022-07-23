# frozen_string_literal: true

class SubscriberUser < ApplicationRecord
  has_one :citizenship_checker
end
