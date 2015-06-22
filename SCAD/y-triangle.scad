use<inc/functions.scad>;

//length: 179mm (??) - 7mm fudge = 172mm
//height: 368mm

//hyp: 406.21177
//lower-angle: 63.83953
//upper-angle: 24.986961

y1_length = 179;
y2_length = (485+40 - 179);
z_height = 368;
fudge_y=7;
fudge_z=0;
hyp1 = sqrt(pow((y1_length-fudge_y),2) + pow(z_height-fudge_z,2));
hyp2 = sqrt(pow((y2_length-fudge_y),2) + pow(z_height-fudge_z,2));

angles1 = [acos(y1_length/hyp1), 90, acos(z_height/hyp1)];
angles2 = [acos(y2_length/hyp2), 90, acos(z_height/hyp2)];

echo("Your short bracing extrusion needs to be " );
echo(hyp1);
echo("mm long.");
echo("Your long bracing extrusion needs to be " );
echo(hyp2);
echo("mm long.");
translate([0,0,0]) {
  lower_bracket(angles1);
  translate([-60,0,0])mirror([0,1,0])lower_bracket(angles1);
}
translate([0,70,0]) {
  lower_bracket(angles2);
  translate([-60,0,0])mirror([0,1,0])lower_bracket(angles2);
}
translate([0,-90,0]) 
{
  upper_bracket(angles1, angles2, fudge_y);
  translate([-90,30,0])mirror([0,1,0])
  upper_bracket(angles1, angles2, fudge_y);
}

module upper_bracket(angle1, angle2, fudge, support = true)
{
  difference() 
  {
    union() 
    {

      translate([0,0,-9.3])rotate([0,0,90])import("src/Z_Top_Compact_-_2x.stl");
      translate([-17.5,0,0])cube([15,25,25], center=true);
      translate([17.5,0,0])cube([15,25,25], center=true);

      translate([20+fudge, 0, 0]) rotate([0,angle1[0],0]) cube([25,25,45], center=true);
      translate([-(20+fudge), 0, 0]) rotate([0,-angle2[0],0]) cube([25,25,45], center=true);

    }
    ext2020(l=20);
    translate([20+fudge, 0, 0]) rotate([0,angle1[0],0]) 
    {
      ext2020(l=40, teeth=[1,0,1,1] );
    }
    translate([-(20+fudge), 0, 0]) rotate([0,-angle2[0],0]) {
      ext2020(l=40, teeth=[0,1,1,1]);
    }
    translate([0, 0, 0]) rotate([0,angle1[0],0]) 
      translate([-25,15,-29]) rotate([90, 0, 0])cylinder(r=5/2 + 0.1, h=30);
    translate([0, 0, 0]) rotate([0,-angle2[0],0]) 
      translate([30,15,-24]) rotate([90, 0, 0])cylinder(r=5/2 + 0.1, h=30);

    ext2020(l=20);
    translate([0,0,-8])cube([5,5,30], center=true);

    translate([-100,-100,-32.5])cube([200,200,20]);
  }
}

module lower_bracket(angles, support=true) 
{
  difference() {
    union() {
      rotate([0,90,0]) 
        translate([0,-25,-10])cube([25,25,40], center=true);
      rotate([0,angles[2],0]) 
        difference()
        { 
          translate([0,0,5])cube([30,30,40], center=true);
          ext2020(l=50, teeth=[1,0,0,0]);
          translate([-15,0,14])rotate([0,90,0])cylinder(r=5/2 + 0.2, h=30);
        }
    }
    rotate([90,0,0])ext2020(l=50, teeth=[0,0,1,1]);
    translate([-14,-13,0])rotate([90,0,0])ext2020(l=50, teeth=[0,0,0,0]);
    translate([0,-25,-14])cylinder(r=5/2 + 0.2, h=30);
    translate([-100,-100,-32.5])cube([200,200,20]);
  }
  if (support) {
    translate([8.5,-35,-10])cylinder(r=1.5, h=20);
    translate([-15,-35,-10])cylinder(r=1.5, h=20);
  }
}
