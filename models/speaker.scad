$fa = .6;
$fs = .3;

R = 9 / 2; // Radius of the speaker.
WALL = 1; // Thickness of the case walls.
RSPH = 10; // Radius of the sphere forming the top bent.
TBASE = 1;
WBASE = 1;
EXTRA = 1.1; // Extra height. Should be adjusted if RSPH changes.

T = TBASE;

module speaker() {
  color("#b13e53") {
    difference() {
      translate([0, 0, 1]) {
        cylinder(h=T, r=R);
        intersection() {
          cylinder(h=20, r=R);
          translate([0, 0, T + EXTRA - RSPH])
            sphere(r=RSPH);
        }
      }
      translate([0, 0, -.01])
        cylinder(h=TBASE + .01, r=R - 1);
      for (x = [0:3], y = [0:3])
        if (!(x == 3 || x == 0) || !(y == 3 || y == 0))
          translate([-R + 1.6 + x * 1.9, -R + 1.6 + y * 1.9, -.01])
            cylinder(h=20, r=.8);
    }
  }
}

speaker();
