Gear Ratio Calculator
=====================

#### Website

Gain ratio calculations with graphing: http://gear-ratio-calculator.herokuapp.com

#### About this project

Ruby library for calculating gear ratios, gain ratios, speeds, etc. for different sizes of cranksets, cassettes, wheels, and crank arms on bicycles.

---

Example of how to calculate an array of gain ratios:

````

calc = GearRatio::Calculator.new chainring_sizes: [44, 33],
        cog_sizes: [11, 13, 15, 17, 19, 21, 24, 28, 32, 36],
        crank_length: 175,
        wheel_circumference: 2168

calc.gain_ratios

# => 

[ [7.88, 6.67, 5.78, 5.1, 4.56, 4.13, 3.61, 3.09, 2.71, 2.4],
  [5.91, 5.0, 4.33, 3.82, 3.42, 3.09, 2.71, 2.32, 2.03, 1.8] ]

````
