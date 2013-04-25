class AddNetRatingsToComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
	t.integer "net_ratings", default: 0
    end
  end
end
