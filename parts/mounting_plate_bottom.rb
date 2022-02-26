class MountingPlateBottom < Part
  def initialize(opts={})
    @opts = opts
    @x = 280
    @y = 280
    @bearing_dia = 22
    @bearing_height = 7
    @z = opts[:multiplex].min
  end

  def hardware
    res = cylinder(d: @bearing_dia, h: @bearing_height)
    res += cylinder(d: @bearing_dia+2, h:0.5)
    res.color("#efefef").move(z:-14.5)
  end

  def part
    res = cube(x: @x, y: @y, z: @z)
    res -= cylinder(d: @opts[:rod_clearance])
    res
  end
end
