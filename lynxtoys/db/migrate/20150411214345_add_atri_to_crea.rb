class AddAtriToCrea < ActiveRecord::Migration
  def change
	add_column :creations, :isAc, :integer,:default => 0    
  end
end
