#!/usr/bin/env ruby
require "jenncad"
include JennCad

# base of the drip box: 48.5cm, second measurement 47.5cm. 47cm should be a good bet.
#
#
# canvas sizes:
#  30x30 basic  22.9cm
#  30x30 canvasmix: 22.1 - 22.25cm
#  25x25 basic: 17.5 - 17.7cm

# ordered:
# 32cm round plate 3mm
# 22.1 cm
# 17.5 cm
#
# mounting holes: 30cm from center
#
# BASE
# use a plastic container and have the base reinforced by 2 wood plates sandwiched to each other, drill holes in it
# top plate: TODO, make it go to the edges for extra stability
# bottom plate, inside: 28x28(max 32)cm plate


# Top mounting: M5x20 din912

# Hardware to get:
#   M10x25 Din912
#   M10 nuts
#   winkel + short wood screws to help me assemble the box




class Artspinner < Project
  def config
    {
      multiplex: [12,15,18,21],
      side_x: 460, # NOTE: I only need one direction somewhat centered
      side_y: 250, #       but it makes ordering easier
      box_height: 100,
      canvas_plate: 229, # 200-38*2, # 228,
      rod_diameter: 10,
      rod_clearance: 22, # F 608 bearings
      mounting_holes: -> (dia: 10, h: 12, z: 0, xy: 0, verbose: false) {
        count = 4
        center_dia = 100
        offset = 0
        if verbose
          puts ""
          puts "For a square plate xy #{xy/10.0} cm "
        end
        res = cylinder(d:0, h:0)
#        if verbose
#          c = center_dia*Math::sin(offset * Math::PI / 180.0)
#          edge = xy/2.0 - c/2.0
#          puts "Diameter: #{dia} from edge: #{edge} mm"
#        end
        for i in 0..count-1 do
          res += cylinder(d: dia, h: h).move(x: center_dia/2.0, z: z).rotate(z: offset+i*360.0/count)
        end
        res
      }
    }
  end

  def idea_plastic_basket_mount
# this was the idea to use a plastic container
    mpb = MountingPlateBottom.new(config)
    mpt = MountingPlateTop.new(config)

    mount = mpb
    mount += mpt.move(z:-config[:multiplex].min - 1.5)

    mount += mpb.hardware
    mount += mpt.hardware
    mount.move(z: -43)

  end

  def motorized_base
    bp = BottomPlate.new(config)
    res = bp
    sp = BoxSide1.new(config)
    res += sp.move(y: config[:side_y]/2.0 - config[:multiplex].min/2.0, z: config[:multiplex].min)
    sp.bom
    sp = BoxSide1.new(config)
    res += sp.move(y: -config[:side_y]/2.0 + config[:multiplex].min/2.0, z: config[:multiplex].min)
    sp = BoxSide2.new(config)
    res += sp.move(x: config[:side_x]/2.0 - config[:multiplex].min/2.0, z: config[:multiplex].min)
    sp.bom
    sp = BoxSide2.new(config)
    res += sp.move(x: -config[:side_x]/2.0 + config[:multiplex].min/2.0, z: config[:multiplex].min)

    top = BoxTop.new(config)
    res += top.move(z: config[:box_height] +  config[:multiplex].min)

    res.move(z: -config[:multiplex].min*2 - config[:box_height])


    res
  end

  def coupling
    Coupling.new(config)
  end

  def control_plate
    cp = ControlPlate.new(config)
    res = cp.color("black")
    res += cp.hardware.color("silver")
    res
  end

  def artspinner
#    bp = BearingPlate.new(config)
    ip = InterfacePlate.new(config)
    cp = CanvasPlate.new(config)
    res = cp.on_top_of(ip)#.on_top_of(bp

    res += motorized_base.move(z:-30)


 #   res += bp.hardware
    res += ip.hardware

    # TODO: I need a base that I can secure on my drip box (possibly start with a fresh drip box)
    #   - it should line up with the inner side of the drip box (or maybe I put a smaller plastic box in the box as base)
    #   - it should have some way to set the level
    #   - maybe a way to motorize it
    res
  end
end

Artspinner.new.run
