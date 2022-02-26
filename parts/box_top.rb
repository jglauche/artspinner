class BoxTop < Part
  def initialize(opts={})
    @opts = opts
    @x = opts[:side_x]
    @y = opts[:side_y]
    @z = opts[:multiplex].min
    @motor_base = 38.5
    @motor_spacing = 47.14
    @motor_hole = 5.5
  end

  def part
    res = cube(x: @x, y: @y, z: @z)
    res -= cylinder(d: @motor_base)
#     puts "for the #{@x}x#{@y} plate order holes dia #{@motor_hole} distance from sides: #{@x/2.0 - @motor_spacing/2.0} mm "
    for i in [1, -1]
      for j in [1, -1]
#        puts "470x470 base plate hole: #{@x/2.0 - @motor_spacing/2.0*i}"
        res -= cylinder(d: @motor_hole).move(x: @motor_spacing/2.0*i, y: @motor_spacing/2.0*j)
      end
    end
    res
  end
end
