class AddQuestionsTagsTable < ActiveRecord::Migration

  def change
    create_table :questions_tags, :id => false do |t|
      t.integer :qustion_id
      t.integer :tag_id
    end
  end
end

