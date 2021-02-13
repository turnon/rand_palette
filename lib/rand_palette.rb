require "rand_palette/version"

module RandPalette

  Scalar = (0..255)
  ScalarDesc = Scalar.to_a.reverse.slice 1,254

  Palette = [Scalar.map{|c| [255, c, 0] },
             ScalarDesc.map{|c| [c, 255, 0] },
             Scalar.map{|c| [0, 255, c] },
             ScalarDesc.map{|c| [0, c, 255] },
             Scalar.map{|c| [c, 0, 255] },
             ScalarDesc.map{|c| [255, 0, c] }].flatten 1

  def self.random n, alpha: 1
    return [] if n <= 0
    raise RangeError, "No more than #{range} kinds od color" if n > range

    picked = rand range
    steps = range / n
    n.times.map do |t|
      picked = picked + steps
      picked = picked - range if picked >= range
      picked
    end.map do |picked|
      RGBA.new(Palette[picked] + [alpha]).to_s
    end
  end

  def self.range
    Palette.size
  end

  class RGBA

    def initialize rgba
      @rgba = rgba
    end

    def to_s
      "rgba(#{@rgba.join(',')})"
    end

  end
end
