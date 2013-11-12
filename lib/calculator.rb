class GearRatio

  class Calculator

    attr_accessor :chainring_sizes
    attr_accessor :cog_sizes
    attr_accessor :crank_length
    attr_accessor :wheel_circumference

    def initialize(chainring_sizes: nil, cog_sizes: nil, crank_length: nil, wheel_circumference: nil)
      @chainring_sizes = initialize_chainring_sizes(chainring_sizes)
      @cog_sizes = initialize_cog_sizes(cog_sizes)
      @crank_length = crank_length
      @wheel_circumference = wheel_circumference
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

    private


    def gain_ratio(chainring_size, cog_size)
      ratio = wheel_radius / crank_length * chainring_size / cog_size
      (ratio * 100).to_i/100.0
    end

    # def wheel_circumference
    #   {
    #     "20x1.75" => 1491,

    #     "700x20c" => 2086,
    #     "700x23c" => 2097,
    #     "700x25c" => 2105,
    #     "700x28c" => 2136,
    #     "700x32c" => 2155,
    #     "700x35c" => 2168,
    #     "700x38c" => 2180,
    #     "700x40c" => 2200,  # guessing
    #     "700x44c" => 2224,
    #     "700x50c" => 2293,
    #     "700x56c" => 2325,

    #     "29x2.3"  => 2325
    #   }[tire_size] || 0
    # end

    # accepts integer, string, array
    # returns a sorted array of integers
    def initialize_chainring_sizes(chainring_sizes)
      chainring_sizes.to_s.scan(/\d+/).map{ |c| c.to_i }.sort.reverse
    end

    # accepts integer, string, array
    # returns a sorted array of integers
    def initialize_cog_sizes(cog_sizes)
      cog_sizes.to_s.scan(/\d+/).map{ |c| c.to_i }.sort
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