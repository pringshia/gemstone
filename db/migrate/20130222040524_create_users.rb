class CreateUsers < ActiveRecord::Migration

	set primary_key :id

  def change
    create_table :users, { :id => false, :primary_key => :id } do |t|
      t.integer :id, :limit => 8

      t.timestamps
    end
  end

  def to_param
  	:id
  end
end
