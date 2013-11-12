require 'spec_helper'

describe Calculator do

  describe "initialization" do
    it "is possible" do
      calc = Calculator.new chainring_sizes: [40],
              cassette_cog_sizes: [11, 13, 15, 17, 19, 21, 24, 28, 32, 36],
              crank_length: 175,
              wheel_circumference: 2168
      calc.chainring_sizes.should eql [40]
      calc.cassette_cog_sizes.should eql [11, 13, 15, 17, 19, 21, 24, 28, 32, 36]
      calc.crank_length.should eql 175
      calc.wheel_circumference.should eql 2168
    end
  end

  describe "#gain_ratios" do
    it "calculates a set of gain ratios for a 1x10 with 175mm crankarms" do
      s = Calculator.new
      s.chainring_sizes     = [40]
      s.cassette_cog_sizes  = [11, 13, 15, 17, 19, 21, 24, 28, 32, 36]
      s.crank_length        = 175
      s.wheel_circumference = 2168

      s.gain_ratios.should eql [[7.16, 6.06, 5.25, 4.63, 4.15, 3.75, 3.28, 2.81, 2.46, 2.19]]
    end

    it "calculates a set of gain ratios for a 1x10 with 200mm crankarms" do
      s = Calculator.new
      s.chainring_sizes     = [40]
      s.cassette_cog_sizes  = [11, 13, 15, 17, 19, 21, 24, 28, 32, 36]
      s.crank_length        = 200
      s.wheel_circumference = 2200

      s.gain_ratios.should eql [[6.36, 5.38, 4.66, 4.11, 3.68, 3.33, 2.91, 2.5, 2.18, 1.94]]
    end

    it "calculates a set of gain ratios for a 20 speed double with 190mm crankarms" do
      s = Calculator.new
      s.chainring_sizes     = [50, 34]
      s.cassette_cog_sizes  = [12, 13, 14, 15, 16, 17, 19, 21, 24, 27]
      s.crank_length        = 190
      s.wheel_circumference = 2105

      s.gain_ratios.should eql [[7.34, 6.78, 6.29, 5.87, 5.51, 5.18, 4.64, 4.19, 3.67, 3.26],
                                [4.99, 4.61, 4.28, 3.99, 3.74, 3.52, 3.15, 2.85, 2.49, 2.22]]
    end

    it "calculates a set of gain ratios for a 21 speed triple with 175mm crankarms" do
      s = Calculator.new
      s.chainring_sizes     = [52, 42, 30]
      s.cassette_cog_sizes  = [11, 12, 13, 14, 15, 17, 19]
      s.crank_length        = 175
      s.wheel_circumference = 2136

      s.gain_ratios.should eql [[9.18, 8.41, 7.77, 7.21, 6.73, 5.94, 5.31],
                                [7.41, 6.79, 6.27, 5.82, 5.43, 4.79, 4.29],
                                [5.29, 4.85, 4.48, 4.16, 3.88, 3.42, 3.06]]
    end

    it "calculates a set of gain ratios for a 20-inch wheeled 24 speed triple with 175mm crankarms" do
      s = Calculator.new
      s.chainring_sizes     = [52, 42, 30]
      s.cassette_cog_sizes  = [12, 14, 16, 18, 21, 24, 28, 32]
      s.crank_length        = 175
      s.wheel_circumference = 1491

      s.gain_ratios.should eql [[5.87, 5.03, 4.4,  3.91, 3.35, 2.93, 2.51, 2.2 ],
                                [4.74, 4.06, 3.55, 3.16, 2.71, 2.37, 2.03, 1.77],
                                [3.39, 2.9,  2.54, 2.26, 1.93, 1.69, 1.45, 1.27]]
    end

    it "calculates a set of gain ratios for a singlespeed 29er with 185mm crankarms" do
      s = Calculator.new
      s.chainring_sizes     = [33]
      s.cassette_cog_sizes  = [16]
      s.crank_length        = 185
      s.wheel_circumference = 2325

      s.gain_ratios.should eql [ [ 4.12 ] ]
    end
  end


  describe "#kph_speeds_at_cadence" do
    it "is 21.55kph for a mountain bike at 75 rpm" do
      s = Calculator.new
      s.chainring_sizes     = [33]
      s.cassette_cog_sizes  = [16]
      s.crank_length        = 185
      s.wheel_circumference = 2325

      s.kph_speeds_at_cadence(75).should eql [ [ 21.55 ] ]
    end
  end

end