$fs = 0.6;

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

MBHOLE = 4.5 - 1; // Margin of the bottom screw holes.
MTHOLE = 12.5 - 1; // Margin of the bottom screw holes.

WSCR = 73; // Width of the display's visible part.
HSCR = 49; // Height of the display's visible part.

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
      pcb_holes();
    }
  pcb_components();
}

module pcb_holes() {
  // screen cutout
  translate([122.5, 11.5, -.1])
    cube([7.4, 36.8, 3]);
  // pad cutout
  translate([6.8, 29, -.1])
    cube([6.2, 13.2, 3]);
  translate([MBHOLE, MBHOLE, -.1])
    cylinder(h=4, r=1);
  translate([W - MBHOLE, MBHOLE, -.1])
    cylinder(h=4, r=1);
  translate([MTHOLE, H - MTHOLE, -.1])
    cylinder(h=4, r=1);
  translate([W - MTHOLE, H - MTHOLE, -.1])
    cylinder(h=4, r=1);
  translate([(W - WSCR) / 2 - 1, 0, -.1])
    cube([WSCR + 2, 1, 4]);
  translate([(W - WSCR) / 2 - 1, H - 1, -.1])
    cube([WSCR + 2, 1, 4]);
}

module pcb_components() {
  // ESP 1
  translate([74.6, 11.6, -TESP])
    cube([WESP, WESP, TESP + .1]);
  // ESP 2
  translate([74.6, 33.6, -TESP])
    cube([WESP, WESP, TESP + .1]);
  // button S
  translate([139.39, 23.77, T - .1])
    pcb_button();
  // button N
  translate([139.39, 42.55, T - .1])
    pcb_button();
  // button W
  translate([129.93, 33.25, T - .1])
    pcb_button();
  // button E
  translate([148.52, 33.25, T - .1])
    pcb_button();
  // button menu
  translate([131.23, 6.25, T - .1])
    pcb_button();
  // usb port
  translate([6.79, 0, -.3])
    pcb_usb_port();
  // extra usb port
  translate([0, 26.6, -.3])
    rotate(270)
      pcb_usb_port();
  // SD card reader
  translate([137.57, 0, 0])
    pcb_sd_card();
  // reset button
  color("blue")
    translate([19.26, -1.28, -2.54])
      cube([2.54, 10.08, 2.54]);
}

module pcb_usb_port() {
  TUSB = 2.56;
  color("white")
    translate([TUSB / 2, 6.20, -TUSB / 2])
      rotate(90, [1, 0, 0])
        difference() {
          hull() {
            cylinder(h=6.20, r=TUSB / 2);
            translate([8.34 - TUSB, 0, 0])
              cylinder(h=6.20, r=TUSB / 2);
          }
          translate([0, 0, .1])
            hull() {
              cylinder(h=6.20, r=TUSB / 2 - .2);
              translate([8.34 - TUSB, 0, 0])
                cylinder(h=6.20, r=TUSB / 2 - .2);
            }
        }
}

module pcb_sd_card() {
  color("white")
    translate([0, 0, -1.20])
      difference() {
        cube([15.49, 13.20, 1.20]);
        translate([.49 / 2, -.1, .2 / 2])
          cube([15, 11, 1]);
      }
}

module pcb_button() {
  color("gray")
    cube([WBTN, HBTN, TBTN + .1]);
  color("blue")
    translate([WBTN / 2, HBTN / 2, 0])
      cylinder(h=6, r=1);
  ;
}

pcb();

translate([-68.61 - 2, 127.4 - 2, 0])
  color("purple")
    import("./pcb.stl");
