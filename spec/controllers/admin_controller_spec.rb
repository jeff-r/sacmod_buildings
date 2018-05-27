require "rails_helper"
require "rspec-rails"

describe AdminController do
  describe "when signed in" do
    fixtures :users

    it "works" do
      sign_in users(:one)
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "when signed out" do
    it "works" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end


