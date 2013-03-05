class AddTokensToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
		t.integer "tokens" , :default => 0
    end
  end
end
