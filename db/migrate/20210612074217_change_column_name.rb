class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
  	rename_column :articles, :stud_id, :student_id
  end
end
