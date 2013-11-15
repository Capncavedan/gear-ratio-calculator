class GearRatio

  class Calculator

    attr :chainring_sizes
    attr :cog_sizes
    attr_accessor :crank_length
    attr_accessor :wheel_circumference

    def initialize(chainring_sizes: nil, cog_sizes: nil, crank_length: nil, wheel_circumference: nil)
      self.chainring_sizes = chainring_sizes
      self.cog_sizes = cog_sizes
      @crank_length = crank_length.to_i
      @wheel_circumference = wheel_circumference.to_i
    end

    def gain_ratios
      ret = []
      chainring_sizes.each do |chainring_size|
        ret << cog_sizes.map{ |cog_size| gain_ratio(chainring_size, cog_size) }
      end
      ret
    end

    def kph_speeds_at_cadence(cadence)
      ret = []
      gain_ratios.each do |gain_ratio_set|
        ret2 = []
        gain_ratio_set.each do |gain_ratio|
          kph = cadence * gain_ratio * crank_circle_circumference * minutes_per_kilometer
          ret2 << (kph * 100).to_i/100.0
        end
        ret << ret2
      end
      ret
    end

    # accepts integer, string, array
    # sets a sorted array of integers
    def chainring_sizes=(sizes)
      @chainring_sizes = sizes.to_s.scan(/\d+/).map{ |c| c.to_i }.sort.reverse
    end

    # accepts integer, string, array
    # sets a sorted array of integers
    def cog_sizes=(sizes)
      @cog_sizes = sizes.to_s.scan(/\d+/).map{ |c| c.to_i }.sort
    end


    private


    def gain_ratio(chainring_size, cog_size)
      ratio = wheel_radius / crank_length * chainring_size / cog_size
      (ratio * 100).to_i/100.0
    end

    def wheel_diameter
      wheel_circumference / Math::PI
    end

    def wheel_radius
       wheel_diameter / 2.0
    end

    def minutes_per_kilometer
      60.0 / 1000.0 / 1000.0
    end

    def crank_circle_circumference
      crank_length * 2.0 * Math::PI
    end

  end

end