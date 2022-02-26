class BottomPlate < Part
  def initialize(opts={})
    @opts = opts
    @x = opts[:side_x]
    @y = opts[:side_y]
    @z = opts[:multiplex].min
  end

  def part
    res = cube(x: @x, y: @y, z: @z)
    res
  end
end
