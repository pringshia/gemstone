class AddNumCommentsColumnToPictures < ActiveRecord::Migration
  def change
  	change_table :pictures do |t|
		t.integer "num_comments" , :default => 0
    end
  end
end
