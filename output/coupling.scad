module Coupling(){
  difference(){
    cylinder(d=40,h=30,$fn=160);
    translate([0, 0, -0.1])cylinder(d=6.369999999999999,h=30.2,$fn=64);
  }
}
$fn=64;
color("DarkOliveGreen")Coupling();
