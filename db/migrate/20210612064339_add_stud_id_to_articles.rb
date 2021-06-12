class AddStudIdToArticles < ActiveRecord::Migration[6.1]
  def change

  	add_column :articles, :stud_id, :int
  end
end
