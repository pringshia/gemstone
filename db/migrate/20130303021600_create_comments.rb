class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer "user_id"
      t.integer "picture_id"
      t.string "commenttext" , :limit => nil
      t.integer "num_ratings" , :default => 0
      t.timestamps
    end
  end
end
