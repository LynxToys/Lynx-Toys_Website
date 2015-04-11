class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do |t|
		t.attachment :cover
      t.timestamps null: false
    end
	add_reference :covers, :creation, index: true
  end
end
