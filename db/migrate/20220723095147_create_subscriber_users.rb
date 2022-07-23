# frozen_string_literal: true

class CreateSubscriberUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriber_users do |t|
      t.string :email
      t.bigint :citizenship_checker_id

      t.timestamps
    end
  end
end
