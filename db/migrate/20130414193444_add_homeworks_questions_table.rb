class AddHomeworksQuestionsTable < ActiveRecord::Migration

  def change
    create_table :homeworks_questions, :id => false do |t|
      t.integer :homework_id
      t.integer :question_id
    end
  end
end
