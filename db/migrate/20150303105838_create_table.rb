class CreateTable < ActiveRecord::Migration
  def change
    create_table :coursemodules do |t|
      t.string :module_code
      t.string :module_name
      t.string :course_code

      t.timestamps
      end
  end
end
