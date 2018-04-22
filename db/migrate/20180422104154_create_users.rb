class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :slack_uid
      t.integer :role
      t.string :name
      t.string :nickname

      t.timestamps
    end
  end
end
