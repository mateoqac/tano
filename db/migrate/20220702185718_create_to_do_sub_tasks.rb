# frozen_string_literal: true

class CreateToDoSubTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :to_do_sub_tasks do |t|
      t.string :task
      t.boolean :done

      t.timestamps
    end
  end
end
