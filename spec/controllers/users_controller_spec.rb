require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET #new" do

    it "renders user's new page" do
      get :new, user: {}

      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    subject(:erick) { User.new(username: 'Erick', password: '654321') }

    context "with valid params" do
      it "validates username and password" do
        post :create, user: {username: "Erick", password: "654321"}
        expect(response).to redirect_to(user_url(User.last))
      end
    end

    context "with INvalid params" do
      it "validates username and password" do
        post :create, user: {username: nil, password: "65321"}
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end

  end

  describe "GET #show" do

    it "renders specific user's show page" do
      get :show, id: 1
      expect(response).to render_template(:show)
    end
    
  end
end
