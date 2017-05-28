require "rails_helper"

RSpec.describe CalculatesController, type: :controller do
  describe "GET #index" do
    before :each do
      get :index, xhr: true
    end

    it "renders the :index js" do
      response.content_type.should == Mime::JS
    end
  end

  describe "POST #create" do
    before :each do
      @log = Fabricate :log
    end

    it "find log by date" do
      post :create, xhr: true, params: {type_of_calculate: "date", date: "10/10/2010"}
      expect(assigns :log_list)
        .to eq([@log])
    end

    it "find log by month" do
      post :create, xhr: true, params: {type_of_calculate: "month", date: "1/10/2010"}
      expect(assigns :log_list)
        .to eq([@log])
    end

    it "find log by period" do
      post :create, xhr: true, params: {type_of_calculate: "period",
        start_date: "1/10/2010", end_date: "31/10/2017"}
      expect(assigns :log_list)
        .to eq([@log])
    end

    it "renders the :create format js" do
      post :create, xhr: true, params: {type_of_calculate: "date", date: "10/10/2010"}
      response.content_type.should == Mime::JS
    end
  end
end
