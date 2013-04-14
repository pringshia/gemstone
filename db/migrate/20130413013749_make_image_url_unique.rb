class MakeImageUrlUnique < ActiveRecord::Migration
  def change
    add_index :pictures, :link, unique: true
  end
end
