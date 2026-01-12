$fa = .6;
$fs = .3;

R = 9 / 2; // Radius of the speaker.
WALL = 1; // Thickness of the case walls.
RSPH = 10; // Radius of the sphere forming the top bent.
TBASE = 1;
WBASE = 1;
EXTRA = 1.1; // Extra height. Should be adjusted if RSPH changes.

T = WALL + TBASE;

module speaker() {
  color("#b13e53") {
    difference() {
      union() {
        cylinder(h=T, r=R);
        intersection() {
          cylinder(h=20, r=R);
          translate([0, 0, T + EXTRA - RSPH])
            sphere(r=RSPH);
        }
        cylinder(h=TBASE, r=R + WBASE);
      }
      translate([0, 0, -.01])
        cylinder(h=TBASE + .01, r=R - 1);
      for (x = [0:5], y = [0:5])
        if (!(x == 5 || x == 0) || !(y == 5 || y == 0))
          translate([-R + 2 + x, -R + 2 + y, -.01])
            cylinder(h=20, r=.3);
    }
  }
}

speaker();
