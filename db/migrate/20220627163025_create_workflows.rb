# frozen_string_literal: true

class CreateWorkflows < ActiveRecord::Migration[7.0]
  def change
    create_table :workflows do |t|
      t.string :workflow_type
      t.string :step_name

      t.timestamps
    end
  end
end
