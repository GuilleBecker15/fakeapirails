class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :pass
      t.string :address
      t.string :city
      t.string :phone
      t.string :website
      t.string :company

      t.timestamps
    end
  end
end
