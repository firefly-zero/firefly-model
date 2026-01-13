W = 167 - 2; // Back panel width.
H = 61 - 2; // Back panel height.
T = 12; // Case thickness without battery.
WFLAT = 38; // Width of the flat surface on the side.
WBEND = 22.393; // Width of the bend in the SVG file.
TBEND = 6; // Height of the bend in the SVG file.
WLOGO = 56.723;
HLOGO = 8.666;
TLOGO = 0.4; // How deep the logo should be etched.

WMID = W - (WFLAT + WBEND) * 2; // Width of the middle panel.

module back() {
  color("#b13e53")
    difference() {
      back_panel_surface();
      // etch the logo
      translate([(W - WLOGO) / 2, (H - HLOGO) / 2, TBEND + 1 - TLOGO])
        linear_extrude(1)
          import(file="logo.svg", layer="plate");
    }
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
    cube([WFLAT, H, 1]);
    // right panel
    translate([W - WFLAT, 0, 0])
      cube([WFLAT, H, 1]);
    // middle panel
    translate([WFLAT + WBEND - 1, 0, TBEND])
      cube([WMID + 2, H, 1]);
  }
}

back();
