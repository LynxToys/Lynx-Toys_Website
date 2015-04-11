class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      	  t.integer :creation_id 
    end
  end
end
