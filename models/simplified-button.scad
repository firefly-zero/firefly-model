$fs = 0.4;

R = 8.9 / 2; // Button radius.
H = 4.5; // Button height.
HCOL = 0.6; // Height of the button's black shaft.
RCOL = 4 / 2; // Radius of the button's black shaft.
RSPH = 10;
WRAIL = 1;

module simplified_button() {
  color("#b13e53")
    intersection() {
      union() {
        translate([0, 0, HCOL]) {
          translate([-WRAIL / 2, -R - 1, 0])
            cube([WRAIL, 2 * R + 2, 1.5]);
          rotate([0, 0, 90])
            translate([-WRAIL / 2, -R - 1, 0])
              cube([WRAIL, 2 * R + 2, 1.5]);
          cylinder(h=H, r=R);
        }
        cylinder(h=2, r=RCOL);
      }
      translate([0, 0, H - RSPH])
        sphere(r=RSPH, $fa=3);
    }
}

simplified_button();
