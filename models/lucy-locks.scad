
ALLOWANCE = .1;
WALL = 1; // Wall thickness.
W = 167 - WALL * 2; // Back panel width.
H = 61 - WALL * 2; // Back panel height.
T = 12; // Case thickness without battery.
WFLAT = 32; // Width of the flat surface on the side.
WBEND = 22.393; // Width of the bend in the SVG file.
TBEND = 6; // Height of the bend in the SVG file.
WLOGO = 56.723;
HLOGO = 8.666;
TLOGO = 0.4; // How deep the logo should be etched.
RB = 4.5 - WALL - ALLOWANCE; // Radius of the bottom corners.
RT = 23.5 - WALL - ALLOWANCE; // Radius of the top corners.
RSCREW = 3 / 2; // Radius of the screw holes.
MBSCREW = 4.5; // Margin of the bottom screw holes.
MTSCREW = 12.5; // Margin of the bottom screw holes.
HCOL = 5.5;

WCONN = 2;
TCONN = 3;
MCONN = 4.7;

WMID = W - (WFLAT + WBEND) * 2; // Width of the middle panel.
WSCR = 73;

module lucy_locks() {
  translate([1, 1, 1])
    mirror([0, 0, 1]) {
      color("blue") {
        translate([(W - WSCR) / 2 + MCONN, ALLOWANCE, TBEND - TCONN])
          cube([WCONN, H - ALLOWANCE * 2, TCONN]);
        translate([W - (W - WSCR) / 2 - WCONN - MCONN, ALLOWANCE, TBEND - TCONN])
          cube([WCONN, H - ALLOWANCE * 2, TCONN]);
      }
      color("cyan") {
        translate([(W - WSCR) / 2, 1 + ALLOWANCE, -5.9])
          mirror([0, 1, 0])
            lucy_lock();
        translate([(W + WSCR) / 2, 1 + ALLOWANCE, -5.9])
          mirror([0, 1, 0])
            mirror([1, 0, 0])
              lucy_lock();
        translate([0, H - 1, 0]) {
          translate([(W - WSCR) / 2, -ALLOWANCE, -5.9])
            lucy_lock();
          translate([(W + WSCR) / 2, -ALLOWANCE, -5.9])
            mirror([1, 0, 0])
              lucy_lock();
        }
      }
    }
}

module lucy_lock() {
  difference() {
    union() {
      // horizontal rail
      cube([15.9, 1, 10]);
      // vertical rail (whisker)
      translate([0, 0, -4])
        cube([10, 1, 9]);
      // the base
      hull() {
        translate([0, -2, 1.5])
          cube([15.9, 3, 10.5]);
        translate([6, -2, 12])
          cube([40, 3, .1]);
      }
    }
    translate([-1, -3, 9])
      cube([5.7, 5, 10]);
  }
}

lucy_locks();
