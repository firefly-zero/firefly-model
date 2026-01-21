use <logo.scad>;

$fs = .2;

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

WMID = W - (WFLAT + WBEND) * 2; // Width of the middle panel.

module back() {
  color("#b13e53")
    union() {
      difference() {
        back_panel_surface();
        // etch the logo
        translate([(W - WLOGO) / 2, (H - HLOGO) / 2, TBEND + 1 - TLOGO])
          logo();
        back_screw_holes();
      }
      back_lucy_locks();
      back_columns();
    }
}

module back_lucy_locks() {
  WSCR = 73;
  translate([(W - WSCR) / 2, 1 + ALLOWANCE, -5.9])
    mirror([0, 1, 0])
      back_lucy_lock();
  translate([(W + WSCR) / 2, 1 + ALLOWANCE, -5.9])
    mirror([0, 1, 0])
      mirror([1, 0, 0])
        back_lucy_lock();
  translate([0, H - 1, 0]) {
    translate([(W - WSCR) / 2, -ALLOWANCE, -5.9])
      back_lucy_lock();
    translate([(W + WSCR) / 2, -ALLOWANCE, -5.9])
      mirror([1, 0, 0])
        back_lucy_lock();
  }
}

module back_lucy_lock() {
  cube([15.9, 1, 10]);
  translate([0, 0, -4])
    cube([1, 1, 9]);
  hull() {
    translate([0, -2, 1.5])
      cube([15.9, 3, 10.5]);
    translate([6, -2, 12])
      cube([40, 3, .1]);
  }
}

module back_screw_holes() {
  // bottom-left screw hole
  translate([MBSCREW, MBSCREW, 0])
    screw_hole();
  // bottom-right screw hole
  translate([W - MBSCREW, MBSCREW, 0])
    screw_hole();
  // top-left screw hole
  translate([MTSCREW, H - MTSCREW, 0])
    screw_hole();
  // top-right screw hole
  translate([W - MTSCREW, H - MTSCREW, 0])
    screw_hole();
}

module back_columns() {
  // bottom-left screw column
  translate([MBSCREW, MBSCREW, 0])
    screw_column();
  // bottom-right screw column
  translate([W - MBSCREW, MBSCREW, 0])
    screw_column();
  // top-left screw column
  translate([MTSCREW, H - MTSCREW, 0])
    screw_column();
  // top-right screw column
  translate([W - MTSCREW, H - MTSCREW, 0])
    screw_column();
}

module back_panel_surface() {
  union() {
    translate([WBEND + WFLAT, H - ALLOWANCE, -1])
      mirror([1, 0, 0])
        rotate(90, [1, 0, 0])
          linear_extrude(H - ALLOWANCE * 2)
            import(file="bend.svg", layer="plate");
    translate([W - WBEND - WFLAT, H - ALLOWANCE, -1])
      rotate(90, [1, 0, 0])
        linear_extrude(H - ALLOWANCE * 2)
          import(file="bend.svg", layer="plate");
    // left panel
    back_side_panel();
    // right panel
    translate([W, 0, 0])
      mirror([1, 0, 0])
        back_side_panel();
    // middle panel
    translate([WFLAT + WBEND - 1, ALLOWANCE, TBEND])
      cube([WMID + 2, H - ALLOWANCE * 2, WALL]);
  }
}

module back_side_panel() {
  EXTRA_T = 1;
  hull() {
    translate([RB + ALLOWANCE, RB + ALLOWANCE, -EXTRA_T])
      cylinder(h=WALL + EXTRA_T, r=RB);
    translate([RT + ALLOWANCE, H - RT - ALLOWANCE, -EXTRA_T])
      difference() {
        cylinder(h=WALL + EXTRA_T, r=RT);
        translate([0, -RT, -.1])
          cube([RT + 1, RT * 2, 6]);
      }
    translate([WFLAT, ALLOWANCE, -EXTRA_T])
      cube([1, H - ALLOWANCE * 2, WALL + EXTRA_T]);
  }
}

module screw_hole() {
  translate([0, 0, -5])
    cylinder(h=10, r=RSCREW);
  depth = .3;
  translate([0, 0, WALL - depth + .001])
    cylinder(h=depth, r1=RSCREW, r2=RSCREW + depth * 2);
}

module screw_column() {
  translate([0, 0, -HCOL])
    difference() {
      cylinder(h=HCOL, r=RSCREW + 1.5);
      translate([0, 0, -.1])
        cylinder(h=HCOL + .2, r=RSCREW);
    }
}

back();
