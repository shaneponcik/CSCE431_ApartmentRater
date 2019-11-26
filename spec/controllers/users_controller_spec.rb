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
    it "doesn't allow non-user to access admin portal" do
      user = nil
      expect(response).to eq (not be_successful)
    end
    it "doesn't allow non-admin to access admin portal" do
      user = User.create(:email => "test@tamu.edu", :password_digest => "13123")
      expect(response).to (not be_successful)
    end
    it "allows admin to access admin portal" do
      user = User.create(:email => "test@tamu.edu", :password_digest => "13123")
      expect(response).to be_successful
    end
  end
  
  describe "users#admin_portal" do
    it "redirects user if not logged in" do
      user = User.create(:email => "", :password_digest => "")
      controller = UsersController.initialize()
      @controller.admin_portal
      expect(response).to (not be_successful)
    end
    it "redirects user if not admin" do
      user = User.create(:email => "test@tamu.edu", :password_digest => "13123")
      controller = UsersController.initialize()
      @controller.admin_portal
      expect(response).to (not be_successful)
    end
    it "allows user to access if admin" do
      user = User.create(:email => "test@tamu.edu", :password_digest => "13123")
      @controller = UsersController.initialize()
      @controller.admin
      @controller.admin_portal
      expect(response).to be_successful
    end
  end
end
