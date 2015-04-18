class Add < ActiveRecord::Migration
  def change
     add_column :votes, :vote_ip, :string
  end
end
