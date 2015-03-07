class RemoveRecur < ActiveRecord::Migration
  def change
    remove_column :events, :recur_times
  end
end
