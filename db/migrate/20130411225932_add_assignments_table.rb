class AddAssignmentsTable < ActiveRecord::Migration
 
  def change
    create_table :assignments do |t|
      t.string :description
      t.string :subject
      t.string :source_type
      t.string :source_id
      t.timestamps
    end
  end
end
