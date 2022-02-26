class CanvasPlate < Part
  def initialize(opts={})
    @opts = opts
    @size = opts[:canvas_plate]
    @z = 10
    @center_hole = 32
    @mounting_dia = 8.8
    @mounting_center = 60
  end

  def part
    res = cube(x: @size, y: @size, z: @z)
    res -= cylinder(d: @center_hole)

    res -= @opts[:mounting_holes].call(dia: @mounting_dia, h: @z, xy: @size, verbose: true)

#    res += cylinder(d: @mounting_dia, h: 30).move(x: -@size/2.0, y: -@size/2.0, z:-10).move(x: 79.14466094067262, y: 79.14466094067262)

    res
  end
end
