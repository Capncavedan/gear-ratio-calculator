require 'spec_helper'

describe Calculator do

  it "calculates a set of gain ratios for a 1x10" do
    s = Calculator.new
    s.chainring_sizes    = [40]
    s.cassette_cog_sizes = [11, 13, 15, 17, 19, 21, 24, 28, 32, 36]
    s.crank_length_in_mm = 175
    s.tire_size           = "700x35c"

    s.gain_ratios.should eql [[7.29, 6.17, 5.34, 4.71, 4.22, 3.81, 3.34, 2.86, 2.50, 2.22]]
  end

  it "calculates a set of gain ratios for a 21 speed triple" do
    s = Calculator.new
    s.chainring_sizes    = [52, 42, 30]
    s.cassette_cog_sizes = [11, 12, 13, 14, 15, 17, 19]
    s.crank_length_in_mm = 175
    s.tire_size           = "700x28c"

    s.gain_ratios.should eql [[9.28, 8.5, 7.85, 7.29, 6.8, 6.0, 5.37],
                              [7.49, 6.87, 6.34, 5.89, 5.49, 4.85, 4.34],
                              [5.35, 4.9, 4.53, 4.2, 3.92, 3.46, 3.1]]
  end

end