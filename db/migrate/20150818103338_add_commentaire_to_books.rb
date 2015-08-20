class AddCommentaireToBooks < ActiveRecord::Migration
  def change
	create_table :comments
	add_column :comments, :author, :string
	add_column :comments, :content, :string
	add_column :comments, :book_id, :integer  
  	add_index :comments, :book_id
  end
end
