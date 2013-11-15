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
