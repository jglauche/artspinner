module MountingPlateBottom(){
  difference(){
    translate([-140, -140, 0])cube([280, 280, 12.0]);
    translate([0, 0, -0.1])cylinder(d=22,h=12.2,$fn=88);
  }
}
module MountingPlateTop(){
  difference(){
    translate([-250, -140, 0])cube([500, 280, 12.0]);
    translate([0, 0, -0.1])cylinder(d=22,h=12.2,$fn=88);
  }
}
$fn=64;
translate([0, 0, -43])union(){
    color("SteelBlue")MountingPlateBottom();
    translate([0, 0, -13.5])color("Aquamarine")MountingPlateTop();
    translate([0, 0, -14.5])color("#efefef")union(){
          cylinder(d=22,h=7,$fn=88);
          cylinder(d=24,h=0.5,$fn=96);
        }

    translate([0, 0, 5])color("#efefef")union(){
          cylinder(d=22,h=7,$fn=88);
          translate([0, 0, 7])cylinder(d=24,h=0.5,$fn=96);
        }

  }

