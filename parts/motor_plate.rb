class MotorPlate < Part
  def initialize(opts={})
    @opts = {
      x: 10,
      y: 10,
      z: 5,
    }.merge(opts)
  end

  def part
    cube(@opts)
  end
end
