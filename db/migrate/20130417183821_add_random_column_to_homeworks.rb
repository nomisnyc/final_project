class AddRandomColumnToHomeworks < ActiveRecord::Migration
  def change
    add_column :homeworks, :random, :string
    remove_column :assignments, :random
  end
end
