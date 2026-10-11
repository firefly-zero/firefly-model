
WSCR = 73 - .2; // Width of the display's visible part.
MDISP = 3; // Width of the display's margin.
H = 6; // Height of the panel.
TFINGER = 3; // Depth of the groove that locks the panel in place.
WFINGER = 10;
WALL = 1; // Thickness of the walls.

module corner_top() {
  color("white")
    difference() {
      union() {
        difference() {
          cube([WSCR, H, H]);
          translate([-.1, H - MDISP, -.1])
            cube([WSCR + .2, 10, H - WALL]);
        }
        translate([0, 1, -1.5])
          cube([WSCR, 5, 2]);
      }
      translate([(WSCR - 11) / 2, -.01, -4])
        cube([11, 10, 4.5]);
      translate([(WSCR - 20) / 2 + 32.1, 10, -1.1])
        rotate([90, 90, 0])
          cylinder(h=20, r=3 / 2, $fs=.1);
    }
}

corner_top();
