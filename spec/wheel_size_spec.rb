require 'spec_helper'

describe GearRatio::WheelSize do

  describe ".circumference_of" do

    it "works" do
      GearRatio::WheelSize.circumference_of("700x25c").should be_a(Fixnum)
    end

    it "works with whitespace etc" do
      GearRatio::WheelSize.circumference_of("700 X 25c").should be_a(Fixnum)
    end

  end

end