class AddResponsesTable < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :answer
      t.boolean :is_correct
      t.integer :homework_id
      t.integer :question_id
      t.timestamps
    end
  end
end
