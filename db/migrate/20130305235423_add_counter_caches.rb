class AddCounterCaches < ActiveRecord::Migration
  def change 
  	remove_column :comments, :num_ratings
		remove_column :pictures, :num_comments
		add_column :comments, :ratings_count, :integer, :default => 0
		add_column :pictures, :comments_count, :integer, :default => 0
		rename_column :comments, :commenttext, :comment_text
		rename_column :ratings, :positive, :is_positive
		Picture.find_each do |pic|
			pic.update_attribute(:comments_count, pic.comments.length)
		end
		Comment.find_each do |comment|
			comment.update_attribute(:ratings_count, comment.ratings.length)
		end
	end
end
