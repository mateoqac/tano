class CreateCitizenshipCheckers < ActiveRecord::Migration[7.0]
  def change
    create_table :citizenship_checkers do |t|
      t.string :question

      t.timestamps
    end
  end
end
