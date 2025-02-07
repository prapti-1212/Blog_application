class CreateSignUps < ActiveRecord::Migration[8.0]
  def change
    create_table :sign_ups do |t|
      t.string :name
      t.string :password
      t.integer :age

      t.timestamps
    end
  end
end
