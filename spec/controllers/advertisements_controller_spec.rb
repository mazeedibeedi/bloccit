require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  let(:my_advert) { Advertisement.create!(title: "Title", body: "Body", price: 10)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the #index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns [my_advert] to @adverts" do
      get :index
      expect(assigns(:adverts)).to eq([my_advert])
    end

  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_advert.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_advert.id}
      expect(response).to render_template :show
    end

    it "assigns my_advert to @advert" do
      get :show, {id: my_advert.id}
      expect(assigns(:advert)).to eq(my_advert)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @advert" do
      get :new
      expect(assigns(:advert)).not_to be_nil
    end
  end

  describe "POST #create" do
    it "increases the number of posts by 1" do
      expect{post :create, advert: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(1000)}}.to change(Advertisement, :count).by(1)
    end

    it "assigns the new post to @post" do
      post :create, advert: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(1000)}
      expect(assigns(:advert)).to eq Advertisement.last
    end

    it "redirects to the new advert" do
      post :create, advert: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(1000)}
      expect(response).to redirect_to Advertisement.last
    end
  end

end
