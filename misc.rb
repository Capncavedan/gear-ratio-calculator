load "lib/calculator.rb"
load "lib/graph.rb"

calc = GearRatio::Calculator.new chainring_sizes: "44 33", cog_sizes: "11 13 15 17 21 24 28 32 36 40", crank_length: 200, wheel_circumference: 2158
calc.gain_ratios
graph = GearRatio::Graph.new(calc)
graph.gain_ratio_line_chart
`mv gain_ratios.png ~/Desktop/`
