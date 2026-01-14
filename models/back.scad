$fs = .2;

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
RB = 4.5 - WALL; // Radius of the bottom corners.
RT = 23.5 - WALL; // Radius of the top corners.
RSCREW = 2 / 2; // Radius of the screw holes.
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
          linear_extrude(1)
            import(file="logo.svg", layer="plate");
        back_screw_holes();
      }
      back_columns();
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
    translate([WBEND + WFLAT, H, 0])
      mirror([1, 0, 0])
        rotate(90, [1, 0, 0])
          linear_extrude(H)
            import(file="bend.svg", layer="plate");
    translate([W - WBEND - WFLAT, H, 0])
      rotate(90, [1, 0, 0])
        linear_extrude(H)
          import(file="bend.svg", layer="plate");
    // left panel
    back_side_panel();
    // right panel
    translate([W, 0, 0])
      mirror([1, 0, 0])
        back_side_panel();
    // middle panel
    translate([WFLAT + WBEND - 1, 0, TBEND])
      cube([WMID + 2, H, WALL]);
  }
}

module back_side_panel() {
  hull() {
    translate([RB, RB, 0])
      cylinder(h=WALL, r=RB);
    translate([RT, H - RT, 0])
      difference() {
        cylinder(h=WALL, r=RT);
        translate([0, -RT, -.1])
          cube([RT + 1, RT * 2, WALL + .2]);
      }
    translate([WFLAT, 0, 0])
      cube([1, H, WALL]);
  }
}

module screw_hole() {
  translate([0, 0, -.1])
    cylinder(h=WALL, r=RSCREW);
  depth = .3;
  translate([0, 0, WALL - depth + .001])
    cylinder(h=depth, r1=RSCREW, r2=RSCREW + depth * 2);
}

module screw_column() {
  translate([0, 0, -HCOL])
    difference() {
      cylinder(h=HCOL, r=RSCREW + WALL);
      translate([0, 0, -.1])
        cylinder(h=HCOL + .2, r=RSCREW);
    }
}

back();
