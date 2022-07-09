# frozen_string_literal: true

class AddItemRefToSubTask < ActiveRecord::Migration[7.0]
  def change
    add_reference :to_do_sub_tasks, :to_do_items, index: true
  end
end
