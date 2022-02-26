class Coupling < Part
  def initialize(opts={})
    @opts = {
    }.merge(opts)
    @rod = 6.35 + 0.02
    @outside = 40
    @h = 30
  end

  def part
    res = cylinder(d: @outside, h: @h)
    res -= cylinder(d: @rod)
    res
  end
end
