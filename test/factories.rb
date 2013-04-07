# User class
FactoryGirl.define do
	factory :user do
		name {Faker::Name.name}
		created_at Time.now
		updated_at Time.now
		oauth_token {(0..20).map{(65+rand(26)).chr}.join} # Random 20 capital letter string
		oauth_expires_at Time.now + 60*60*24*365 # One year in the future
		id {rand(100000000)} 
	end

end
