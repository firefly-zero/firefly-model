$fs = 0.4;

R = 8.9 / 2; // Button radius.
H = 3; // Button height.
HCOL = 2.5; // Height of the button's black shaft.
RCOL = 2 / 2; // Radius of the button's black shaft.
RSPH = 10;

module simplified_button() {
  color("#b13e53")
    intersection() {
      difference() {
        cylinder(h=H, r=R);
        translate([0, 0, -.1])
          cylinder(h=HCOL, r=RCOL);
      }
      translate([0, 0, H - RSPH])
        sphere(r=RSPH);
    }
}

simplified_button();
