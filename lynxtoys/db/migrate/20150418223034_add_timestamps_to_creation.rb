
class AddTimestampsToCreation < ActiveRecord::Migration
  def change
    add_column :creations, :created_at, :datetime
    add_column :creations, :updated_at, :datetime
  end
end
