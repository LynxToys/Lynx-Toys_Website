class AddImageToProjects < ActiveRecord::Migration
  def up
	add_column :creations, :image_file_name, :string
	add_column :creations, :image_content_type, :string
	add_column :creations, :image_file_size, :integer
	add_column :creations, :image_uploaded_at, :datetime
  end
  
  def down
	remove_column :creations, :image_file_name, :string
	remove_column :creations, :image_content_type, :string
	remove_column :creations, :image_file_size, :integer
	remove_column :creations, :image_uploaded_at, :datetime
  end
end
