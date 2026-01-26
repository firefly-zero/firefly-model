$fs = .4;

R = 35 / 2; // Holder radius (equal to touchpad radius).
BR = 9.1 / 2; // Button hole radius.
T = 1; // Thickness.
M = 3.7; // Margin between holder boundary and button hole.
TTUBE = 1; // Thickness of the tube wall.
HTUBE = 1.5; // Height of the tube.
WRAIL = 1.1; // Width of the rail cutout.

module button_hole() {
  translate([R - M - BR, 0, -.1])
    cylinder(h=T + .2, r=BR);
}

module rail() {
  translate([-BR - TTUBE - .1, -WRAIL / 2, -.1])
    cube([(BR + TTUBE + .1) * 2, WRAIL, HTUBE + .2]);
}

module tube() {
  translate([R - M - BR, 0, T])
    difference() {
      cylinder(h=HTUBE, r=BR + TTUBE);
      translate([0, 0, -.1])
        cylinder(h=HTUBE + .2, r=BR);
      rail();
      rotate(90) rail();
    }
}

module button_holder() {
  color("#1a1c2c") union() {
      difference() {
        cylinder(h=T, r=R);
        button_hole();
        rotate(90) button_hole();
        rotate(180) button_hole();
        rotate(270) button_hole();
      }
      tube();
      rotate(90) tube();
      rotate(180) tube();
      rotate(270) tube();
    }
}

button_holder();
