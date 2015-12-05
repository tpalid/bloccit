require 'rails_helper'

describe Vote do
    describe "validations" do
        describe "value validation" do
            it "allows 11 as a value" do
                expect(Vote.new(value: 1)).to be_valid
            end
            it "allows -1 as a value" do
                expect(Vote.new(value: -1)).to be_valid
            end
            it "doesn't -1 as a value" do
                expect(Vote.new(value: 0)).to_not be_valid
            end
        end
    end
end