class AddStartAndEndTimesToModules < ActiveRecord::Migration
  def change
    add_column :coursemodules, :start_time, :datetime
    add_column :coursemodules, :end_time, :datetime
  end
end
