module BottomPlate(){
  translate([-230, -125, 0])cube([460, 250, 12.0]);}
module BoxSide1(){
  translate([-230, -6, 0])cube([460, 12, 100.0]);}
module BoxSide2(){
  translate([-6, -113, 0])cube([12, 226, 100.0]);}
module BoxTop(){
  difference(){
    translate([-230, -125, 0])cube([460, 250, 12.0]);
    translate([0, 0, -0.1])cylinder(d=38.5,h=12.2,$fn=154);
    translate([0, 0, -0.1])translate([23.57, 23.57, 0])cylinder(d=5.5,h=12.2,$fn=64);
    translate([0, 0, -0.1])translate([23.57, -23.57, 0])cylinder(d=5.5,h=12.2,$fn=64);
    translate([0, 0, -0.1])translate([-23.57, 23.57, 0])cylinder(d=5.5,h=12.2,$fn=64);
    translate([0, 0, -0.1])translate([-23.57, -23.57, 0])cylinder(d=5.5,h=12.2,$fn=64);
  }
}
$fn=64;
translate([0, 0, -124])union(){
    color("Teal")BottomPlate();
    translate([0, 119, 12])color("HotPink")BoxSide1();
    translate([0, -119, 12])color("DarkOrchid")BoxSide1();
    translate([224, 0, 12])color("MediumVioletRed")BoxSide2();
    translate([-224, 0, 12])color("OrangeRed")BoxSide2();
    translate([0, 0, 112])color("LightCoral")BoxTop();
  }

