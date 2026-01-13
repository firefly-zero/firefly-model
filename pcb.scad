W = 163;
H = 57;
T = 1.6;
RB = 4.5; // Radius of the bottom corners.
RT = 23.5; // Radius of the top corners.
WESP = 20.30; // Width of ESP chip.
TESP = 3.3; // Thickness of ESP chip.

WBTN = 4.1;
HBTN = 4.3;
TBTN = 3;

module pcb() {
  color("green")
    difference() {
      hull() {
        // top-left corner
        translate([RT, H - RT, 0])
          cylinder(h=T, r=RT);
        // top-right corner
        translate([W - RT, H - RT, 0])
          cylinder(h=T, r=RT);
        // bottom-left corner
        translate([RB, RB, 0])
          cylinder(h=T, r=RB);
        // bottom-right corner
        translate([W - RB, RB, 0])
          cylinder(h=T, r=RB);
      }
      translate([111.0, 2.8, -.1])
        cube([9.4, 41.9, 3]);
      translate([5.35, 27.9, -.1])
        cube([7.2, 13.8, 3]);
    }
  // ESP 1
  translate([74.6, 11.6, -TESP])
    cube([WESP, WESP, TESP + .1]);
  // ESP 2
  translate([74.6, 33.6, -TESP])
    cube([WESP, WESP, TESP + .1]);
  // button S
  translate([138.7, 23.5, T - .1])
    button();
  // button N
  translate([138.7, 42.6, T - .1])
    button();
  // button W
  translate([129.0, 33.4, T - .1])
    button();
  // button E
  translate([146.9, 33.4, T - .1])
    button();
  // button menu
  translate([130.1, 5.9, T - .1])
    button();
}

module button() {
  color("gray")
    cube([WBTN, HBTN, TBTN + .1]);
  color("blue")
    translate([WBTN / 2, HBTN / 2, 0])
      cylinder(h=6, r=1);
  ;
}

pcb();
