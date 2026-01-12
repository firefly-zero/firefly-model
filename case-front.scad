W = 167;
H = 61;
T = 12;
RT = 23.5;
RB = 4.5;

// main casing
color("#b13e53") {
    union() {
        // middle vert
        translate([RT, 0, 0])
            cube([W-RT*2, H, T]);
        // tlc
        translate([RT, H-RT, 0])
            cylinder(h=12, r=RT);
        // trc
        translate([W-RT, H-RT, 0])
            cylinder(h=12, r=RT);
        // blc
        translate([RB, RB, 0])
            cylinder(h=12, r=RB);
        // brc
        translate([W-RB, RB, 0])
            cylinder(h=12, r=RB);
        // middle hor
        translate([0, RB, 0])
            cube([W, H-RT-RB, T]);
        // bottom
        translate([RB, 0, 0])
            cube([W-RB*2, RB, T]);
    }
}

