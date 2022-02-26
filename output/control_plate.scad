module ControlPlate(){
  difference(){
    translate([0, 0, 0])cube([150, 60, 3.0]);
    translate([0, 0, -0.1])translate([30, 30, 0])cylinder(d=5.4,h=3.2,$fn=64);
    translate([0, 0, -0.1])translate([75, 30, 0])cylinder(d=7.3,h=3.2,$fn=64);
    translate([0, 0, -0.1])translate([120, 30, 0])cylinder(d=20.2,h=3.2,$fn=81);
  }
}
$fn=64;
union(){
  color("black")ControlPlate();
  translate([75, 30, 3])color("silver")cylinder(d=24,h=3,$fn=96);
}

