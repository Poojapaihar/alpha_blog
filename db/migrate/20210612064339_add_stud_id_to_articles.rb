class AddStudIdToArticles < ActiveRecord::Migration[6.1]
  def change

  	add_column :articles, :student_id, :int
  end
end
