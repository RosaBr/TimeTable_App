class AddCoursemoduleColumn < ActiveRecord::Migration
  def change
    add_column :coursemodules, :title, :string
  end
end
