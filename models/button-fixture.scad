$fs = .4;

R = 35 / 2; // Holder radius (equal to touchpad radius).
BR = 2.45 / 2; // Button hole radius.
T = 1; // Thickness.
M = 3.7 + 9.1 / 2 - BR; // Margin between holder boundary and button hole.
// M = 3.7 + 9 / 2 - BR / 2; // Margin between holder boundary and button hole.
// M = 7.1; // Margin between holder boundary and button hole.
WSTICK = 4.5;

module button_hole() {
  translate([R - M - BR, 0, -.1])
    cylinder(h=T + .2, r=BR);
}

module button_fixture() {
  color("purple") union() {
      difference() {
        button_fixture_base();
        // cylinder(h=T, r=R);
        button_hole();
        rotate(90) button_hole();
        rotate(180) button_hole();
        rotate(270) button_hole();
      }
    }
  color("cyan") {
    button_fixture_hook();
    rotate(90)
      button_fixture_hook();
  }
}

module button_fixture_hook() {
  translate([R, -WSTICK / 2, 0])
    cube([6, WSTICK, 1]);
  translate([R + 4, -WSTICK / 2, -1.6])
    cube([2, WSTICK, 1.6]);
}

module button_fixture_base() {
  translate([-R, -WSTICK / 2, 0])
    cube([R * 2, WSTICK, 1]);
  rotate(90)
    translate([-R, -WSTICK / 2, 0])
      cube([R * 2, WSTICK, 1]);
}

button_fixture();
