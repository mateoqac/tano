# frozen_string_literal: true

class CreateLoginUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :login_users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.datetime :confirmed_at

      t.timestamps
    end

    add_index :login_users, :email, unique: true
  end
end
