class InterfacePlate < Part
  def initialize(opts={})

    @opts = opts
    @d = 320

    @z = 3
    @hole = 10.2
    @dowel_dia = 6
    @dowel_height = 30
    @dowel_z = -9
    @mounting_holes = 4
    @mounting_dia = 5.3
    @mounting_center = 60
  end


  def hardware
    bolt = Din912.new(10, 25)
    res += bolt.show().mirror(z:1).move(z:@z)
    nut = Din934.new(10)
    res += nut.show().mirror(z:1).move(z: 0)


    #puts "Interface plate: "
    @opts[:mounting_holes].call(dia: @mounting_dia, h: @z, xy: @d, verbose: true)


#res += @opts[:mounting_holes].call(dia: @dowel_dia, h: @dowel_height, z: @dowel_z)
=begin
    nut = Din934.new(8)
    lo += nut.show()
    nut = Din934.new(8)
    lo += nut.show().rotate(z:30).move(z: 6.5)

    lo += cylinder(d: 19, h: 2).move(z:0).color("silver")
    lo += cylinder(d: 19, h: 3).move(z:-3.2).color("SandyBrown")
    lo += cylinder(d: 19, h: 2).move(z:-5.4).color("silver")

    lo += nut.show().rotate(z:0).move(z: -39.5)
    lo += nut.show().rotate(z:30).move(z: -46)
=end


   # res += lo.move(z:-25)
    res
  end


  def part
    res = cylinder(d: @d, z: @z)
    res -= cylinder(d: @hole)

    res -= @opts[:mounting_holes].call(dia: @mounting_dia, h: @z)
    res
  end
end
