
T = 1; // touchpad thickness
ADH = .25; // adhesive thickness
R = 35 / 2; // touchpad radius
SAFE = 1; // safe zone width

module touchpad() {
  color("#1a1c2c")
    cylinder(h=T, r=R);
  color("yellow")
    translate([0, 0, -ADH])
      cylinder(h=ADH, r=R);
  color("red")
    translate([0, 0, -ADH - .001])
      cylinder(h=ADH, r=R - SAFE);
  color("white")
    translate([-9.2 / 2, R - 8, -4.4])
      cube([9.2, 3.6, 4.4]);
}

touchpad();
