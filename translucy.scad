WSCR = 73 - .2; // Width of the display's visible part.
MDISP = 3; // Width of the display's margin.
H = 6; // Height of the panel.
TFINGER = 2.1; // Depth of the groove that locks the panel in place.
WALL = 1; // Thickness of the walls.

module translucy() {
  color("white", alpha=.5)
    difference() {
      cube([WSCR, H, H]);
      translate([-.1, WALL, -.1])
        cube([WSCR + .2, WALL, TFINGER + .1]);
      translate([-.1, H - MDISP, -.1])
        cube([WSCR + .2, 10, H - WALL]);
      translate([-.1, WALL, 0])
        cube([TFINGER + .1, WALL, H - WALL]);
      translate([WSCR - TFINGER + .1, WALL, 0])
        cube([TFINGER + .1, WALL, H - WALL]);
    }
}

translucy();
