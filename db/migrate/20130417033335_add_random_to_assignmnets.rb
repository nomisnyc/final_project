class AddRandomToAssignmnets < ActiveRecord::Migration
  def change
    add_column :assignments, :random, :string
  end
end
