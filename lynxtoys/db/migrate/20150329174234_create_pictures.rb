class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :creation_id
	  t.integer :picture_id
	  t.string :url
    end
  end
end
