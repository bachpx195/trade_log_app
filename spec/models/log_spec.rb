require "rails_helper"

RSpec.describe Log, type: :model do
  describe "columns" do
    it{is_expected.to have_db_column(:name).of_type :string}
    it{is_expected.to have_db_column(:adress).of_type :string}
    it{is_expected.to have_db_column(:money).of_type :float}
    it{is_expected.to have_db_column(:datetime).of_type :datetime}
  end

  describe "validation" do
    it "is valid with a name, money, datetime" do
      log = Log.new name: "log", money: 10, datetime: "10/10/2010".to_date
      expect(log).to be_valid
    end

    it "is invalid without a name" do
      log = Log.new money: 10, datetime: "10/10/2010".to_date
      log.valid?
      expect(log.errors[:name]).to include("không thể để trắng")
    end

    it "is invalid without a money" do
      log = Log.new name: "log", datetime: "10/10/2010".to_date
      log.valid?
      expect(log.errors[:money]).to include("không thể để trắng", "không phải là số")
    end

    it "is invalid without a datetime" do
      log = Log.new money: 10, name: "log"
      log.valid?
      expect(log.errors[:datetime]).to include("không thể để trắng")
    end
  end

  describe "scope" do
    it "find logs by date" do
      Log.destroy_all
      log = Log.create name: "log", money: 10, datetime: "10/10/2010".to_date, status: :success
      Log.get_logs_by_date("10/10/2010".to_date).first
        .should == log
    end

    it "find logs by period" do
      Log.destroy_all
      log = Log.create name: "log", money: 10, datetime: "10/10/2010".to_date, status: :success
      Log.get_logs_by_month("1/10/2010".to_date, "30/10/2010".to_date).first
        .should == log
    end
  end
end
