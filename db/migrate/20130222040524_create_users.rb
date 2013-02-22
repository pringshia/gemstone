class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, { :id => false, :primary_key => :id } do |t|
      t.integer :id, :limit => 8

      t.timestamps
    end
  end
end
