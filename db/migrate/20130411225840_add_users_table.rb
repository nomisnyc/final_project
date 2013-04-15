class AddUsersTable < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :is_teacher
      t.string :password_digest
      t.text :address
      t.string :phone
      t.timestamps
    end
  end
end
