require 'test_helper'

class RandPaletteTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RandPalette::VERSION
  end

  attr_reader :colors

  def setup
    @colors = RandPalette.random(3, alpha: 0.8)
  end

  def test_alpha
    assert colors.all?{|color| color =~ /0\.8\)/}
  end

  def test_rgb
    rgbs_count = colors.
      map{|color| /(\d+,\d+,\d+)/.match color}.
      map{|match| match[0].split(',')}.
      flatten.
      uniq
    assert 3, rgbs_count
  end
end
