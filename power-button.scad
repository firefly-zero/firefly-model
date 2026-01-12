$fs = 0.4;

R = 8.9/2;      // Button radius.
WALLS = 1;      // Case wall thickness.
HPCB = 3;       // Height of the button PCB.
SPACE = 6;      // Distance between main PCB and front panel.
PRESS = 1;      // How much the button moves when pressed.
HCOL = 3;       // Height of the button's black shaft.
RCOL = 2/2;     // Radius of the button's black shaft.
WRAIL = 0.9;    // Width of the rail.

assert(SPACE-PRESS-HPCB > 0);
assert(SPACE+WALLS-PRESS-HPCB > 0);
assert(HCOL-PRESS > 0);

module rail() {
    translate([RCOL, -WRAIL/2, 0])
        cube([R-RCOL+1, WRAIL, SPACE-PRESS-HPCB]);    
}

color("#b13e53") union() {
    difference() {
        cylinder(h=SPACE+WALLS-PRESS-HPCB, r=R);
        translate([0, 0, -.1])
            cylinder(h=HCOL-PRESS+.1, r=RCOL);
    }
    rail();
    rotate(90) rail();
    rotate(180) rail();
    rotate(270) rail();
}