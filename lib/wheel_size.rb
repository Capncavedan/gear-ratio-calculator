class GearRatio

  class WheelSize

    # accepts a string description, returns mm
    def self.circumference_of(tire_size)
      tire_size = tire_size.to_s.downcase.gsub(/[\W]/, '')
      {
        "20x1.75" => 1491,

        "700x20c" => 2086,
        "700x23c" => 2097,
        "700x25c" => 2105,
        "700x28c" => 2136,
        "700x32c" => 2155,
        "700x35c" => 2168,
        "700x38c" => 2180,
        "700x40c" => 2200,  # guessing
        "700x44c" => 2224,
        "700x50c" => 2293,
        "700x56c" => 2325,

        "29x2.3"  => 2325
      }[tire_size]
    end

  end

end