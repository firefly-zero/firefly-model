include <power-button.scad>

$fa = 4;

// The radius of the sphere used for bending the top.
RSPH = 15;
// Elevation of the button from the case.
ELVTN = 1;

module button() {
  color("#1a1c2c")
    intersection() {
      translate([0, 0, BTN_HEIGHT])
        cylinder(h=20, r=R);
      translate([0, 0, ELVTN + BTN_HEIGHT - RSPH])
        sphere(r=RSPH);
    }
}

button();
