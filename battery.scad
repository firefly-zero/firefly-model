W = 63;
H = 39;
T = 7.6;

module battery() {
  color("#566c86") hull() {
      translate([0, T / 2, 0])
        rotate(a=90, v=[0, 1, 0])
          cylinder(h=W, r=T / 2);
      translate([0, H - T / 2, 0])
        rotate(a=90, v=[0, 1, 0])
          cylinder(h=W, r=T / 2);
    }
  color("yellow")
    translate([W, T / 2 - 1, -1])
      cube([2, 6, 2]);
}

battery();
