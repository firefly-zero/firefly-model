use <display.scad>

W = 167; // Case width.
H = 61; // Case height.
T = 12; // Case thickness without battery.
RT = 23.5; // Top corners radius.
RB = 4.5; // Botton corners radius.
WALLS = 1; // Thickness of the case walls.

RPAD = 35.45 / 2; // Touchpad radius.
MPAD = 6; // Margin between pad & case edges.

WSCR = 73; // Width of the display's visible part.
HSCR = 49; // Height of the display's visible part.

TBAT = 6; // Battery thickness.
WBAT = WSCR; // Battery width.

RPWR = 9 / 2; // Power button radius.
RSPK = RPWR; // Speaker radius.

module outline(margin = 0) {
  hull() {
    // top-left corner
    translate([RT + margin, H - RT - margin, 0])
      cylinder(h=T, r=RT);
    // top-right corner
    translate([W - RT - margin, H - RT - margin, 0])
      cylinder(h=T, r=RT);
    // bottom-left corner
    translate([RB + margin, RB + margin, 0])
      cylinder(h=T, r=RB);
    // bottom-right corner
    translate([W - RB - margin, RB + margin, 0])
      cylinder(h=T, r=RB);
    // battery
    translate([(W - WBAT) / 2, margin, -TBAT - margin])
      cube([WBAT, H - margin * 2, TBAT]);
  }
}

module front() {
  color("#b13e53")
    difference() {
      outline();
      translate([0, 0, -1])
        outline(margin=1);
      // touchpad hole
      translate([RPAD + MPAD, H - RPAD - MPAD, T - WALLS - .1])
        cylinder(h=WALLS + .2, r=RPAD);
      // buttons group hole
      translate([W - RPAD - MPAD, H - RPAD - MPAD, T - WALLS - .1])
        cylinder(h=WALLS + .2, r=RPAD);
      // screen hole
      translate([(W - WSCR) / 2, (H - HSCR) / 2, T - WALLS - .1])
        cube([WSCR, HSCR, WALLS + .2]);
      // speaker hole
      translate([MPAD + RPAD * 2 - RSPK, (H - HSCR) / 2 + RSPK, T - WALLS - .1])
        cylinder(h=WALLS + .2, r=RSPK);
      // power button hole
      translate([W - MPAD - RPAD * 2 + RPWR + 5, (H - HSCR) / 2 + RPWR, T - WALLS - .1])
        cylinder(h=WALLS + .2, r=RPWR);
      // LEDs bottom hole
      insert_size = (H - HSCR) / 2;
      translate([(W - WSCR) / 2, -.1, T - insert_size - .1])
        cube([WSCR, insert_size + .2, insert_size + .2]);
      // LEDs top hole
      translate([(W - WSCR) / 2, H - insert_size - .1, T - insert_size - .1])
        cube([WSCR, insert_size + .2, insert_size + .2]);
    }

  // corners holding the display
  color("blue") {
    translate([43.6, 2.1, 8.5])
      display_corner();
    translate([43.6, H - 2.1, 8.5])
      mirror([0, 1, 0])
        display_corner();
    translate([W - 36.8, 2.1, 8.5])
      mirror([1, 0, 0])
        display_corner();
    translate([W - 36.8, H - 2.1, 8.5])
      mirror([1, 1, 0])
        display_corner();
  }
}

module display_corner() {
  difference() {
    cube([3, 3, 2.7]);
    translate([1, 1, -1])
      cube([3, 3, 10]);
  }
}

front();

// translate([81 + 47 - 5, (H - 54.6) / 2, T - 2.6 - WALLS])
//   mirror([1, 0, 0])
//     display();
