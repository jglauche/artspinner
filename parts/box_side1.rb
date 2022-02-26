class BoxSide1 < Part
  def initialize(opts={})
    @opts = opts
    @x = @opts[:side_x]
    @y = @opts[:multiplex].min
    @z = @opts[:box_height]
  end

  def bom
    puts "side wall 1 (order 2): #{@z/10.0}x#{@x/10.0} cm"
  end

  def part
    cube(x: @x, y: @y, z: @z)
  end
end
