$fs = 0.4;

H = 4;
RCOL = 2.4 / 2;
RBTN = 9 / 2;

module button_v3() {
  difference() {
    cylinder(h=H, r=RBTN);
    translate([0, 0, -1])
      cylinder(h=H, r=RCOL);
    translate([0, 0, -2.5])
      cylinder(h=H, r=RBTN - 1);
  }
}

button_v3();
