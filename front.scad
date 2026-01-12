W = 167;        // Case width.
H = 61;         // Case height.
T = 12;         // Case thickness without battery.
RT = 23.5;      // Top corners radius.
RB = 4.5;       // Botton corners radius.
WALLS = 1;      // Thickness of the case walls.
RPAD = 35/2;    // Touchpad radius.
MPAD = 6;       // Margin between pad & case edges.
WSCR = 73;      // Width of the display's visible part.
HSCR = 49;      // Height of the display's visible part.

module outline(margin=0) {
    hull() {
        // top-left corner
        translate([RT+margin, H-RT-margin, 0])
            cylinder(h=12, r=RT);
        // top-right corner
        translate([W-RT-margin, H-RT-margin, 0])
            cylinder(h=12, r=RT);
        // bottom-left corner
        translate([RB+margin, RB+margin, 0])
            cylinder(h=12, r=RB);
        // bottom-right corner
        translate([W-RB-margin, RB+margin, 0])
            cylinder(h=12, r=RB);
    }    
}

// main casing
color("#b13e53") 
    difference() {
        outline();
        translate([0, 0, -1])
            outline(margin=1);
        // touchpad hole
        translate([RPAD+MPAD, H-RPAD-MPAD, T-WALLS-.1])
            cylinder(h=WALLS+.2, r=RPAD);
        // buttons group hole
        translate([W-RPAD-MPAD, H-RPAD-MPAD, T-WALLS-.1])
            cylinder(h=WALLS+.2, r=RPAD);
        // screen hole
        translate([(W-WSCR)/2, (H-HSCR)/2, T-WALLS-.1])
           cube([WSCR, HSCR, WALLS+.2]);
    }
