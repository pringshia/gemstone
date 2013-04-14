require 'spec_helper'

describe UsersController do
	integrate_views
	
	it "should redirect to index with a notice on successful save" do 
		post 'create' 
	end
end
