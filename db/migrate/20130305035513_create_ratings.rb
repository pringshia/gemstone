class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer "user_id"
      t.integer "comment_id"
      t.boolean "positive"
      t.datetime "created_at"
    end
  end
end
