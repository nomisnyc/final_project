class AddHomeworksTable < ActiveRecord::Migration

  def change
    create_table :homeworks do |t|
      t.text :instruction
      t.integer :user_id
      t.integer :classroom_id
      t.string :grade
      t.date :due_date
    end
  end
end
