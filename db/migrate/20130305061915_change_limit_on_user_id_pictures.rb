class ChangeLimitOnUserIdPictures < ActiveRecord::Migration
  def up
  	change_column :pictures, :user_id, :integer, :limit => 8
  end

  def down
  	change_column :pictures, :user_id, :integer, :limit => 4
  end
end
