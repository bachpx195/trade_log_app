require "rails_helper"

RSpec.describe LogsController, type: :controller do
  describe "GET #index" do
    before :each do
      DatabaseCleaner.start
      @log = Fabricate :log
    end

    it "assigns @logs" do
      get :index
      expect(assigns :logs)
        .to eq([@log])
    end

    it "assigns @title" do
      get :index
      expect(assigns :title)
        .to eq "Lịch sử giao dịch"
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    before :each do
      DatabaseCleaner.start
    end

    it "renders the :new format js" do
      xhr :get, 'new'
      response.content_type.should == Mime::JS
    end
  end

  describe "POST #create" do
    before :each do
      DatabaseCleaner.start
      @params = {
        name: "log",
        money: 10,
        datetime: "10/10/2010".to_date,
        status: :success
      }
    end

    it "creates a new log" do
      expect{
        post :create, xhr: true, params: {log: @params}
      }.to change(Log,:count).by(1)
    end

    it "renders the :create format js" do
      xhr :post, 'create', params: {log: @params}
      response.content_type.should == Mime::JS
    end
  end

  describe "GET #edit" do
    before :each do
      DatabaseCleaner.start
      @log = Fabricate :log
      get :edit, xhr: true, params: {id: @log.id}
    end

    it "assigns @log" do
      expect(assigns :log)
        .to eq @log
    end

    it "renders the :edit format js" do
      response.content_type.should == Mime::JS
    end
  end

  describe "PUT #update" do
    before :each do
      DatabaseCleaner.start
      @log = Fabricate :log
      @params = {
        name: "Updated"
      }

      put :update, xhr: true, params: {id: @log.id, log: @params}
      @log.reload
    end

    it "find log" do
      expect(assigns :log)
        .to eq @log
    end

    it {expect(@log.name).to eq "Updated"}

    it "renders the :update format js" do
      response.content_type.should == Mime::JS
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      DatabaseCleaner.start
      @log = Fabricate :log
    end

    it "find log by id" do
      delete :destroy, xhr: true, params: {id: @log.id}
      expect(assigns :log)
        .to eq @log
    end

    it "deletes the log" do
      expect{
        delete :destroy, xhr: true, params: {id: @log.id}
      }.to change(Log,:count).by(-1)
    end
  end
end
