rod_diameter = 10;

difference() {
  union(){
    translate([0,0,30])import("../STL Files/X_Axis_Motor_Block_-_1x.stl");
    translate([-22,-22.5,0])color("red")cube([19,15,15]);
    translate([-22,-22.5,45])color("red")cube([19,15,15]);
  }
  translate([-13,-15,7])rotate([0,90,0])color("yellow") hull() {
    cylinder(r=rod_diameter/2 + 0.1, h=10, $fn=60);
    translate([-3,0,5])cube([5,5,10],center=true); // comment this line for tighter fit
  }
  translate([-13,-15,52])rotate([0,90,0])color("yellow") hull() {
    cylinder(r=rod_diameter/2 + 0.1, h=10, $fn=60);
    translate([-3,0,5])cube([5,5,10],center=true); // comment this line for tighter fit
  }
}
