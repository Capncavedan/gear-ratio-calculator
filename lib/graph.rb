class GearRatio

  class Graph
    require 'gruff'

    def initialize(calculator)
      @calculator = calculator
    end

    def render_gain_ratio_line_chart
      g = Gruff::Line.new
      g.title = 'Gain Ratios'
      hsh = {}
      @calculator.cog_sizes.reverse.each_with_index do |c, idx|
        hsh[idx] = c.to_s
      end
      g.labels = hsh

      @calculator.chainring_sizes.each_with_index do |chainring_size, idx|
        g.data chainring_size.to_s, @calculator.gain_ratios[idx].reverse
      end

      filename = random_filename
      g.write("public/graphs/#{filename}")
      filename
    end

    def random_filename
      "gain_ratios_#{rand(1_000_000).to_s}.png"
    end

  end

end
