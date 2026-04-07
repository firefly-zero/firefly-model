
WSCR = 73 - .2; // Width of the display's visible part.
MDISP = 3; // Width of the display's margin.
H = 6; // Height of the panel.
TFINGER = 3; // Depth of the groove that locks the panel in place.
WFINGER = 10;
WALL = 1; // Thickness of the walls.

module corner() {
  color("white")
    union() {
      difference() {
        cube([WSCR, H, H]);
        translate([-.1, H - MDISP, -.1])
          cube([WSCR + .2, 10, H - WALL]);
      }
      translate([0, 1, -.5])
        cube([WSCR, 3, 1]);
    }
}

corner();
