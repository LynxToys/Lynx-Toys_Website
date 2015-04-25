class AddEmailToCreations < ActiveRecord::Migration
  def change
    add_column :creations, :email, :string
  end
end
