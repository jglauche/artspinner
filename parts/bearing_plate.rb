include JennCad::Extras
class BearingPlate < Part
  def initialize(opts={})
    @d = 150 # min: 100mm
    @bearing_dia = 22
    @bearing_height = 7
    @bearings = 3

    @z = opts[:multiplex].max

    # TODO: check the bearings I have. Been thinking 3 sandwiched to each other will work, but I could get different ones
    @hole = @bearing_dia + 0.2 # 608

  end

  def hardware
    res = cylinder(d: @bearing_dia, h: @bearing_height*3).color("#efefef")

    bolt = Din933.new(8, 100)
    res += bolt.show().mirror(z:1).move(z:@z)
    nut = Din934.new(8)
    res += nut.show().mirror(z:1).move(z:@z - @bearings*@bearing_height)
  end

  def part(show=false)
    res = cylinder(d: @d, h: @z)
    res -= cylinder(d: @hole)
    res
  end
end
