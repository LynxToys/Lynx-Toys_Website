class CreateCreations < ActiveRecord::Migration
  def change
    create_table :creations do |t|
	t.string :name
	t.string :creator_name
	t.string :description
	t.integer :likes
	#timestamp
    end
	add_attachment :creations, :cover
  end
end
