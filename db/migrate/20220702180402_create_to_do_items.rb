# frozen_string_literal: true

class CreateToDoItems < ActiveRecord::Migration[7.0]
  def change
    create_table :to_do_items do |t|
      t.string :task
      t.boolean :done

      t.timestamps
    end
  end
end
