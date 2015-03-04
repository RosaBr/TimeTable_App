class ChangeNameOfModuleTable < ActiveRecord::Migration
  def change
    rename_table :module_tables, :course_module_tables
  end
end
