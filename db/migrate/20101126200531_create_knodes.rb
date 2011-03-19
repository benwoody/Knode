class CreateKnodes < ActiveRecord::Migration
  def self.up
    create_table :knodes do |t|
      t.string :title
      t.string :info
      t.string :media
      t.string :links
      
      t.timestamps
    end
    add_index :knodes, :user_id
  end

  def self.down
    drop_table :knodes
  end
end
