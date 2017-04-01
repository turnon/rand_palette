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
    picked = rand Palette.size
    steps = Palette.size / n
    n.times.map do |t|
      picked = picked + steps
      picked = picked - Palette.size if picked >= Palette.size
      picked
    end.map do |picked|
      RGBA.new(Palette[picked] + [alpha]).to_s
    end
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
