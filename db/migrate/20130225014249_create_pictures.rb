class CreatePictures < ActiveRecord::Migration
  def change
  	create_table :pictures do |t|
  		t.integer "user_id"
  		t.string "link"
  		t.timestamps
  	end
  end
end
