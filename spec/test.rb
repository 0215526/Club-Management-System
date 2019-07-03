require "spec_helper"

RSpec.describe News, :type => :model do
    it "is valid with valid attributes" do
        binding.pry 
        news =create(:news)
        expect(news).to be_valid
    end
end

