# frozen_string_literal: true

class AddComingStateToLoginUser < ActiveRecord::Migration[7.0]
  def change
    add_column :login_users, :state, :string, null: true
  end
end
