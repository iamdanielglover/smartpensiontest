require 'rspec'
require './db/seeds.rb'

RSpec.configure do |config|
  config.formatter = :documentation
end

# TESTS
RSpec.describe Loginfo do 
    before(:each) do
        @uniqueIpsHash = Loginfo.orderByUniqueVisits
        @ipsHash = Loginfo.orderByTotalVisits
        @visit = Loginfo.all.first
    end

    it "should be type of class" do
        expect(Loginfo).to be_kind_of(Class)
    end

    it "should have a length of 500" do 
        expect(Loginfo.all.length).to eq(500)
    end

    it "has a method to organise visits into a hash - orderByTotalVisits - has six unique keys" do
        expect(@ipsHash.length).to be(6)
    end

    it "has a method to organise visits into a hash - orderByUniqueVisits - has six unique keys" do
        expect(@uniqueIpsHash.length).to be(6)
    end

    it "should create an instance variable, and have a type of object" do
        expect(@visit).to be_kind_of(Object)
    end

    it "should be initialized with two attributes - an ip address and a route" do
        expect(@visit.ip).not_to be(nil)
        expect(@visit.ip).to eq("126.318.035.038")
        expect(@visit.route).to eq("/help_page/1")
    end

    it "should have an attribute - ip address -  should be String type" do
        expect(@visit.ip).to be_kind_of(String)
    end

    it "an ip attribute should be a length of 15" do
        @visit.ip.length === 15
    end

end

