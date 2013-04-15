class AddClassroomsUsersTable < ActiveRecord::Migration


  def change
    create_table :classrooms_users, :id => false do |t|
      t.integer :classroom_id
      t.integer :user_id
    end
  end
end

