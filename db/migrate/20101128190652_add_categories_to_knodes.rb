class AddCategoriesToKnodes < ActiveRecord::Migration
  def self.up
    add_column :knodes, :category, :string
  end

  def self.down
  end
end
