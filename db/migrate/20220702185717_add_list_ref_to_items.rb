# frozen_string_literal: true

class AddListRefToItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :to_do_items, :to_do_lists, index: true
  end
end
