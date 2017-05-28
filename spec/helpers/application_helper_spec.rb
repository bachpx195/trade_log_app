require "rails_helper"

describe ApplicationHelper do
  describe "#total_money" do
    before :each do
      DatabaseCleaner.start
    end

    it "returns true" do
      @log = Fabricate :log
      helper.total_money(Log.all).should eq @log.money
    end
  end

  describe "#format_money" do
    it "returns format of money" do
      helper.format_money(1).should eq "1 VNĐ"
    end

    it "returns format of money" do
      helper.format_money(1, false).should eq "1"
    end

    it "returns nil" do
      helper.format_money(0).should eq ""
    end

    it "returns nil" do
      helper.format_money(0, false).should eq ""
    end
  end

  describe "#format_date_ddMMyyyHHmm" do
    it "returns nil" do
      helper.format_date_ddMMyyyHHmm(nil).should eq ""
    end

    it "returns format of money" do
      helper.format_date_ddMMyyyHHmm("10/10/2010".to_date).should eq '10/10/2010 '
    end
  end

  describe "#format_date_MMyyy" do
    it "returns nil" do
      helper.format_date_MMyyy(nil).should eq ""
    end

    it "returns format of money" do
      helper.format_date_MMyyy("10/10/2010".to_date).should eq '10/2010'
    end
  end
end
