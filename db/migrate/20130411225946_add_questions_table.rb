class AddQuestionsTable < ActiveRecord::Migration

  def change
    create_table :questions do |t|
      t.string :text
      t.integer :assignment_id
      t.timestamps
    end
  end
end
