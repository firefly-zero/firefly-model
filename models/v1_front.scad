T = 12;
WLEFT = 53;
WRIGHT = 55;
WDISP = 81; // Total width of the display.
HDISP = 54.6; // Total height of the display.
WSCR = 73; // Width of the display's visible part.
HSCR = 49; // Height of the display's visible part.
H = 60.25;
W = WLEFT + WDISP + WRIGHT;
MDISP = 3;
DPAD = 40;
RPAD = DPAD / 2;
RT = 15;
RB = 5;

module v1_front() {
  difference() {
    outline();
    translate([0, 0, -1])
      outline(shift=1);
    translate([WLEFT, MDISP, 3])
      cube([WSCR, HSCR, 10]);
  }
}

module outline(shift = 0) {
  hull() {
    translate([RT, H - RT, 0])
      cylinder(h=T, r=RT - shift);
    translate([RB, RB, 0])
      cylinder(h=T, r=RB - shift);
    translate([W - RT, H - RT, 0])
      cylinder(h=T, r=RT - shift);
    translate([W - RB, RB, 0])
      cylinder(h=T, r=RB - shift);
  }
}

v1_front();
