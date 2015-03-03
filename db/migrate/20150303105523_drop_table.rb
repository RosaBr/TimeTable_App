class DropTable < ActiveRecord::Migration
  def change
    drop_table :course_module_tables
  end
end
