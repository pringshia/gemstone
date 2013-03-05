class ChangeLimitOnUserIdComments < ActiveRecord::Migration
  def up
  	change_column :comments, :user_id, :integer, :limit => 8
  end

  def down
  	change_column :comments, :user_id, :integer, :limit => 4
  end
end
