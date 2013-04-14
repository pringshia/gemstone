class AddCaptionToPictures < ActiveRecord::Migration
  def change
    change_table :pictures do |t|
      t.string "caption", :default => "Say something nice!"
    end
  end
end
