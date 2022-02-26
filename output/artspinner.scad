module CanvasPlate(){
  difference(){
    translate([-114.5, -114.5, 0])cube([229, 229, 10.0]);
    translate([0, 0, -0.1])cylinder(d=32,h=10.2,$fn=128);
    translate([0, 0, -0.004])union(){
        translate([0, 0, -0.1])cylinder(d=0,h=10.2,$fn=64);
        translate([0, 0, -0.004])rotate([0, 0, 0])translate([50, 0, 0])cylinder(d=8.8,h=10.015999999999998,$fn=64);
        translate([0, 0, -0.004])rotate([0, 0, 90])translate([50, 0, 0])cylinder(d=8.8,h=10.015999999999998,$fn=64);
        translate([0, 0, -0.004])rotate([0, 0, 180])translate([50, 0, 0])cylinder(d=8.8,h=10.015999999999998,$fn=64);
        translate([0, 0, -0.004])rotate([0, 0, 270])translate([50, 0, 0])cylinder(d=8.8,h=10.015999999999998,$fn=64);
      }

  }
}
module InterfacePlate(){
  difference(){
    cylinder(d=320,h=3,$fn=1280);
    translate([0, 0, -0.1])cylinder(d=10.2,h=3.2,$fn=64);
    translate([0, 0, -0.004])union(){
        translate([0, 0, -0.1])cylinder(d=0,h=3.2,$fn=64);
        translate([0, 0, -0.004])rotate([0, 0, 0])translate([50, 0, 0])cylinder(d=5.3,h=3.016,$fn=64);
        translate([0, 0, -0.004])rotate([0, 0, 90])translate([50, 0, 0])cylinder(d=5.3,h=3.016,$fn=64);
        translate([0, 0, -0.004])rotate([0, 0, 180])translate([50, 0, 0])cylinder(d=5.3,h=3.016,$fn=64);
        translate([0, 0, -0.004])rotate([0, 0, 270])translate([50, 0, 0])cylinder(d=5.3,h=3.016,$fn=64);
      }

  }
}
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
module din912fbottoms10l25(){
  union(){
    translate([0, 0, -10])color("Gainsboro")cylinder(d=16,h=10,$fn=64);
    color("DarkGray")cylinder(d=10,h=25,$fn=64);
  }
}
module din934s10(){
  color("Gainsboro")difference(){
      cylinder(d=19.629909152447276,h=8,$fn=6);
      translate([0, 0, -0.004])cylinder(d=10,h=8.015999999999998,$fn=64);
    }
}
$fn=64;
union(){
  translate([0, 0, 3])color("HotPink")CanvasPlate();
  color("DarkOrchid")InterfacePlate();
  translate([0, 0, -30])translate([0, 0, -124])union(){
        color("MediumVioletRed")BottomPlate();
        translate([0, 119, 12])color("OrangeRed")BoxSide1();
        translate([0, -119, 12])color("LightCoral")BoxSide1();
        translate([224, 0, 12])color("SteelBlue")BoxSide2();
        translate([-224, 0, 12])color("Aquamarine")BoxSide2();
        translate([0, 0, 112])color("DarkOliveGreen")BoxTop();
      }

  union(){
    translate([0, 0, 3])mirror([0, 0, 1])din912fbottoms10l25();
    translate([0, 0, 0])mirror([0, 0, 1])din934s10();
  }

}

