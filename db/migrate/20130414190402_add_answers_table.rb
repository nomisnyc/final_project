class AddAnswersTable < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :text
      t.boolean :is_correct
      t.integer :question_id
      t.timestamps
    end
  end
end
