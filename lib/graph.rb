class GearRatio

  class Graph
    require 'gruff'

    def initialize(calculator)
      @calculator = calculator
    end

    def gain_ratio_line_chart
      g = Gruff::Line.new
      g.title = 'Gain Ratios'
      hsh = {}
      @calculator.cog_sizes.each_with_index do |c, idx|
        hsh[idx] = c.to_s
      end
      g.labels = hsh

      @calculator.chainring_sizes.each_with_index do |chainring_size, idx|
        g.data chainring_size.to_s, @calculator.gain_ratios[idx].reverse
      end
      g.write('gain_ratios.png')
    end

  end

end


# calc = GearRatio::Calculator.new chainring_sizes: "52 42 30", cog_sizes: "11 12 13 14 15 17 19 21 23 25", crank_length: 200, wheel_circumference: 2158

# calc.gain_ratios

# graph = GearRatio::Graph.new(calc)

# graph.gain_ratio_line_chart

# `open gain_ratios.png`
