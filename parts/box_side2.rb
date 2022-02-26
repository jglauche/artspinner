class BoxSide2 < Part
  def initialize(opts={})
    @opts = opts
    @x =  @opts[:multiplex].min
    @y = @opts[:side_y] - opts[:multiplex].min*2
    @z = @opts[:box_height]
  end

  def bom
    puts "side wall 2 (order 2): #{@z/10.0}x#{@y/10.0} cm"
  end

  def part
    cube(x: @x, y: @y, z: @z)
  end
end
