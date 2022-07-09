# frozen_string_literal: true

class Workflow < ApplicationRecord
  after_initialize :set_defaults
end
