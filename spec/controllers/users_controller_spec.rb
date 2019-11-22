require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Tag. As you add validations to Tag, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TagsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  
  let(:invalid_session) { {} }

  describe "GET users#admin_portal" do
    it "doesn't allow non-admin to access" do
      User.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to not be_successful
    end
    it "doesn't allow non-admin to access" do
      User.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to not be_successful
    end
  end
  
  describe "admin_portal" do
    it "redirects user if not logged in" do
      User.create! invalid_session
      get :index params: {}, session: invalid_session
      expect 
    end
    it "redirects user if not admin" do
      
    end
    it "allows user to access if admin"
      
    end
  end
end
