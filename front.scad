use <back.scad>

$fs = 0.6;

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

RPWR = 9.1 / 2; // Power button radius.
RSPK = RPWR; // Speaker radius.
RRST = 1.2; // Reset button radius.

HCOL = 2.9; // Height of the screw column.
RCOL = 2 / 2; // Radius of the screw holes in the column.
MBCOL = 4.5 + 1; // Margin of the bottom screw holes.
MTCOL = 12.5 + 1; // Margin of the bottom screw holes.

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
      front_holes();
      fat_back_panel();
    }
  color("blue")
    front_supports();
}

module front_supports() {
  front_columns();

  translate([RPAD + MPAD, H - RPAD - MPAD, T - WALLS])
    pad_support();
  translate([W - RPAD - MPAD, H - RPAD - MPAD, T - WALLS - .1])
    pad_support();

  // corners holding the display
  translate([42.8, 1.9, 8.5])
    display_corner();
  translate([42.8, H - 2.3, 8.5])
    mirror([0, 1, 0])
      display_corner();
  translate([W - 38, 1.9, 8.5])
    mirror([1, 0, 0])
      display_corner();
  translate([W - 38, H - 2.3, 8.5])
    mirror([1, 1, 0])
      display_corner();
}

module pad_support() {
  translate([0, 0, -1])
    difference() {
      cylinder(h=1, r=RPAD + 1);
      translate([0, 0, -.1])
        cylinder(h=1.2, r=RPAD - 1);
    }
}

module front_holes() {
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
  // reset button hole
  translate([MPAD + RPAD * 2 - RRST, H - MPAD - RRST, T - WALLS - .1])
    cylinder(h=WALLS + .2, r=RRST);
  // LEDs bottom hole
  insert_size = (H - HSCR) / 2;
  translate([(W - WSCR) / 2, -.1, T - insert_size - .1])
    cube([WSCR, insert_size + .2, insert_size + .2]);
  // LEDs top hole
  translate([(W - WSCR) / 2, H - insert_size - .1, T - insert_size - .1])
    cube([WSCR, insert_size + .2, insert_size + .2]);
}

module display_corner() {
  difference() {
    cube([3, 3, 2.7]);
    translate([1, 1, -1])
      cube([3, 3, 10]);
  }
}

module fat_back_panel() {
  translate([166, -2, 0])
    rotate(180, [0, 1, 0])
      scale([1, 1.2, 1])
        union() {
          back_panel_surface();
          translate([0, 0, 0.9])
            back_panel_surface();
          translate([0, 0, 1.8])
            back_panel_surface();
          translate([0, 0, 2.7])
            back_panel_surface();
          translate([0, 0, 3.6])
            back_panel_surface();
          translate([0, 0, 4.5])
            back_panel_surface();
        }
}

module front_columns() {
  // bottom-left screw column
  translate([MBCOL, MBCOL, T - WALLS - HCOL - .001])
    screw_column();
  // bottom-right screw column
  translate([W - MBCOL, MBCOL, T - WALLS - HCOL - .001])
    screw_column();
  // top-left screw column
  translate([MTCOL, H - MTCOL, T - WALLS - HCOL - .001]) {
    translate([0, 0, HCOL - WALLS])
      cylinder(h=WALLS, r=RCOL + WALLS + 1);
    screw_column();
  }
  // top-right screw column
  translate([W - MTCOL, H - MTCOL, T - WALLS - HCOL - .001]) {
    translate([0, 0, HCOL - WALLS])
      cylinder(h=WALLS, r=RCOL + WALLS + 1);
    screw_column();
  }
}

module screw_column() {
  difference() {
    cylinder(h=HCOL, r=RCOL + WALLS);
    translate([0, 0, -.1])
      cylinder(h=HCOL + .2, r=RCOL);
  }
}

front();
