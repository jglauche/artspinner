class ControlPlate < Part
  def initialize(opts={})
    @opts = opts
    @x = 150
    @y = 60
    @z = 3

    # direction sw
    @direction_switch = 5.4
    @x1 = 30
    @y1 = 30

    # knob
    @pwm = 7.3
    @pwm_knob_dia = 24
    @pwm_knob_height = 15
    @pwm_x = @x/2.0
    @pwm_y = 30

    # power
    @power_switch = 20.2

    @x2 = 120
    @y2 = 30
  end

  def hardware
    res = cylinder(d: @pwm_knob_dia, h: @pwm_knob_h).move(x: @pwm_x, y: @pwm_y, z: @z)
    res
  end

  def part
    res = cube(x: @x, y: @y, z: @z, center: false)

    res -= cylinder(d: @direction_switch).move(x: @x1, y: @y1)

    res -= cylinder(d: @pwm).move(x: @pwm_x, y: @pwm_y)
    res -= cylinder(d: @power_switch).move(x: @x2, y: @y2)



    res
  end
end
