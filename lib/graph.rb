class GearRatio

  class Graph
    require 'gruff'

    def initialize(calculator)
      g = Gruff::Line.new
      g.title = 'Gain Ratios'
      hsh = {}
      calculator.cog_sizes.each_with_index do |c, idx|
        hsh[idx] = c.to_s
      end
      g.labels = hsh

      calculator.chainring_sizes.each_with_index do |chainring_size, idx|
        g.data chainring_size.to_s, calculator.gain_ratios[idx].reverse
      end
      g.write('exciting.png')
    end

  end

end