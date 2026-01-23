T = 1.6;
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

module v1_pcb() {
  color("green")
    cube([W, H, T]);
  translate([WLEFT, MDISP, T]) {
    color("#AAAAAA")
      cube([WDISP, HDISP, T]);
    color("#444444")
      translate([5.30, (HDISP - HSCR) / 2, .1])
        cube([WSCR, HSCR, T + .5]);
  }
  color("gray")
    translate([12.40 + RPAD, 5.5 + RPAD, T])
      cylinder(h=5, r=RPAD);
  color("purple") {
    translate([WLEFT + WDISP + 11.20, MDISP + 3, T])
      button();
    translate([WLEFT + WDISP, 0, T])
      buttons();
  }
}

module buttons() {
  // west
  translate([20.6, 30.12, 0])
    button();
  // east
  translate([20.6 + 17.70, 30.12, 0])
    button();
  // south
  translate([20.6 + 17.7 / 2, 21.30, 0])
    button();
  // north
  translate([20.6 + 17.7 / 2, H - 21.30, 0])
    button();
}

module button() {
  translate([0, 0, T])
    cylinder(h=5, r=3);
}

v1_pcb();
