class Calculator

  attr_accessor :chainring_sizes
  attr_accessor :cassette_cog_sizes
  attr_accessor :crank_length_in_mm
  attr_accessor :tire_size

  def gain_ratios
    ret = []
    chainring_sizes.each do |chainring_size|
      ret2 = []
      cassette_cog_sizes.each do |cog_size|
        ret2 << gain_ratio(chainring_size, cog_size)
      end
      ret << ret2
    end
    ret
  end


  private


  def gain_ratio(chainring_size, cog_size)
    ratio = wheel_radius_mm / crank_length_in_mm * chainring_size / cog_size
    (ratio * 100).to_i/100.0
  end

  def wheel_circumference_mm
    {
      "700x20c" => 2086,
      "700x23c" => 2097,
      "700x25c" => 2105,
      "700x28c" => 2136,
      "700x32c" => 2155,
      "700x35c" => 2168,
      "700x38c" => 2180,
      "700x40c" => nil,
      "700x44c" => 2224,
      "700x50c" => 2293,
      "700x56c" => 2325,

      "29x2.3"  => 2325
    }[tire_size] || 0
  end

  def wheel_radius_mm
    wheel_circumference_mm / 3.1415926536 / 2.0
  end

end