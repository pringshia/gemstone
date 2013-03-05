class AddRedeemedToComments < ActiveRecord::Migration
  def change
  	change_table :comments do |t|
		t.boolean "redeemed" , :default => false
    end
  end
end
