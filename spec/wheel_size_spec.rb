require 'spec_helper'

describe GearRatio::WheelSize do

  describe ".circumference_of" do

    it "works" do
      GearRatio::WheelSize.circumference_of("700x25c").should eql 2105
    end

    it "works with whitespace etc" do
      GearRatio::WheelSize.circumference_of("700 X 25C").should eql 2105
    end

  end

end