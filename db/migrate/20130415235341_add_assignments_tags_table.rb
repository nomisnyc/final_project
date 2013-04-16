class AddAssignmentsTagsTable < ActiveRecord::Migration
  def change
    create_table :assignments_tags, :id => false do |t|
      t.integer :assignment_id
      t.integer :tag_id
    end
  end
end
