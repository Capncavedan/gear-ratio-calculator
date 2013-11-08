class Calculator

  attr_accessor :chainring_sizes
  attr_accessor :cassette_cog_sizes
  attr_accessor :crank_length_in_mm
  attr_accessor :tire_size

  def gain_ratios
    ret = []
    chainring_sizes.each do |chainring_size|
      cassette_cog_sizes.each do |cog_size|
        ratio = wheel_radius_mm / crank_length_in_mm * chainring_size / cog_size
        ret << (ratio * 100).to_i/100.0
      end
    end
    ret
  end


  private

  def wheel_circumference_mm
    {
      "700x35c" => 2205.0
    }[tire_size]
  end

  def wheel_radius_mm
    wheel_circumference_mm / 3.14159 / 2.0
  end

end