WSCR = 73; // Width of the display's visible part.
HSCR = 49; // Height of the display's visible part.
TSCR = .3; // Visible part of display thickness.

WDISP = 81; // Total width of the display.
HDISP = 54.6; // Total height of the display.
WTAIL = 83.80 - WDISP;
HTAIL = 5;
TDISP = 2.6 - TSCR; // Totatl thickness.

ML = 3; // Margin left.
MB = (HDISP - HSCR) / 2; // Margin bottom.
MR = WDISP - ML; // Margin right.
MT = MB; // Margin top.

module display() {
  color("#1a1c2c")
    translate([ML, MB, TSCR])
      cube([WSCR, HSCR, TDISP]);
  color("gray")
    cube([WDISP, HDISP, TDISP]);
  color("white") {
    translate([WDISP, 0, 0])
      cube([WTAIL, HTAIL, TDISP]);
    translate([WDISP, HDISP - HTAIL, 0])
      cube([WTAIL, HTAIL, TDISP]);
  }
  color("yellow")
    translate([WDISP, (HDISP - 30) / 2, (TDISP - .5) / 2])
      cube([WTAIL, 30, .5]);
}

display();
