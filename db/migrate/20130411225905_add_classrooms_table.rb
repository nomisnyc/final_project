class AddClassroomsTable < ActiveRecord::Migration

  def change
    create_table :classrooms do |t|
      t.string :subject
      t.integer :teach_id
      t.timestamps
    end
  end
end
