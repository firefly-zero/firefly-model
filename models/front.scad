include <params.scad>

$fs = 0.6;

W = CASE_W; // Case width.
H = CASE_H; // Case height.
T = 12; // Case thickness without battery.
RT = 23.5; // Top corners radius.
RB = 4.5; // Botton corners radius.
WALLS = 1; // Thickness of the case walls.

RPAD = TOUCHPAD_R + TOUCHPAD_A; // Touchpad radius.
MPAD = TOUCHPAD_ML; // Margin between pad & case edges.

WSCR = SCREEN_W; // Width of the display's visible part.
HSCR = SCREEN_H; // Height of the display's visible part.

TBAT = 6; // Battery thickness.
WBAT = WSCR; // Battery width.

RPWR = 9.1 / 2; // Power button radius.
RSPK = RPWR; // Speaker radius.
RRST = 1.2; // Reset button radius.

HCOL = 2.9; // Height of the screw column.
RCOL = 2 / 2; // Radius of the screw holes in the column.
MBCOL = 4.5 + 1; // Margin of the bottom screw holes.
MTCOL = 12.5 + 1; // Margin of the bottom screw holes.
RNUT = 4.37 / 2 + .1;
HNUT = 1.53 + .5;

// The box with rounded corners representing the whole device outline.
//
// Margin substracts N mm from all sides, which is used
// to cut the hollow space in the case outline, turning it
// from a brick into an ampty box.
module outline(margin = 0) {
  hull() {
    // top-left corner
    translate([RT, H - RT, 0])
      cylinder(h=T, r=RT - margin, $fa=1);
    // top-right corner
    translate([W - RT, H - RT, 0])
      cylinder(h=T, r=RT - margin, $fa=1);
    // bottom-left corner
    translate([RB, RB, 0])
      cylinder(h=T, r=RB - margin);
    // bottom-right corner
    translate([W - RB, RB, 0])
      cylinder(h=T, r=RB - margin);
    // battery
    translate([(W - WBAT) / 2, margin, -TBAT - margin])
      cube([WBAT, H - margin * 2, TBAT]);
  }
}

module front() {
  color("#b13e53")
    difference() {
      outline();
      translate([0, 0, -1])
        outline(margin=1);
      front_holes();
      back_panel_cut();
    }

  color("blue") {
    front_columns();
    front_supports();
  }
}

module front_supports() {
  difference() {
    translate([RPAD + MPAD, H - RPAD - MPAD, T - WALLS + .001])
      pad_support();
    // Cut hole for the nut.
    translate([MTCOL, H - MTCOL, T - WALLS - HCOL - .001])
      cylinder(h=10, r=RCOL, $fs=.2);
  }

  difference() {
    translate([W - RPAD - MPAD, H - RPAD - MPAD, T - WALLS + .001])
      buttons_support();
    // Cut hole for the nut.
    translate([W - MTCOL, H - MTCOL, T - 5])
      cylinder(h=10, r=RCOL, $fs=.2);
  }

  // corners holding the display
  translate([42.8, 2.2, 8.5])
    display_corner();
  translate([42.8, H - 2.6, 8.5])
    mirror([0, 1, 0])
      display_corner();
  translate([W - 37.9, 2.2, 8.5])
    mirror([1, 0, 0])
      display_corner();
  translate([W - 37.9, H - 2.6, 8.5])
    mirror([1, 1, 0])
      display_corner();
}

// The bedding for glue'ing in touchpad.
module pad_support() {
  PH = 2.4 + .5;
  translate([0, 0, -PH], $fa=1) {
    difference() {
      cylinder(h=PH + .1, r=RPAD + 2);
      translate([0, 0, -0.01])
        cylinder(h=4.5, r=RPAD + .001);
    }
    difference() {
      cylinder(h=2.4, r=RPAD + 2);
      // Cutout for the pad connector.
      translate([-15, -11 / 2, -.1])
        cube([5, 11, 4]);
      // Cutout for C16 and C17 transistors.
      intersection() {
        translate([-15, -25 / 2 - 2, 1])
          cube([8, 9.5, 4]);
        cylinder(h=5, r=RPAD - 1.5);
      }
      // Cutout for the pad's chip
      intersection() {
        translate([-2, -RPAD, .81])
          cube([RPAD + 2, RPAD * 2, 1.6]);
        translate([0, 0, -.1])
          cylinder(h=4.2, r=RPAD - 1.5);
      }
    }
  }
}

// The bedding for glue'ing in buttons holder.
module buttons_support() {
  PH = 1.5;
  translate([0, 0, -PH])
    difference() {
      cylinder(h=PH + .1, r=RPAD + 3);
      translate([0, 0, WALLS])
        cylinder(h=WALLS, r=RPAD + .001, $fa=1);
      // Cutout for S and N buttons.
      translate([-11.5 / 2, -32 / 2, -.1])
        cube([11.5, 32, 4]);
      // Cutout for W and E buttons.
      translate([-32 / 2, -11.5 / 2, -.1])
        cube([32, 11.5, 4]);
      // Cutout for the display.
      translate([-RPAD - 5, -RPAD, -1])
        cube([5, RPAD * 2, 5]);
    }
}

module front_holes() {
  // touchpad hole
  translate([RPAD + MPAD, H - RPAD - MPAD, T - WALLS - .1])
    cylinder(h=WALLS + .2, r=RPAD, $fa=1);
  // buttons group hole
  translate([W - RPAD - MPAD, H - RPAD - MPAD, T - WALLS - .1])
    cylinder(h=WALLS + .2, r=RPAD, $fa=1);
  // screen hole
  translate([(W - WSCR) / 2, (H - HSCR) / 2, T - WALLS - .1])
    cube([WSCR, HSCR, WALLS + .2]);
  // speaker hole
  translate([MPAD + RPAD * 2 - RSPK, (H - HSCR) / 2 + RSPK, T - WALLS - .1])
    cylinder(h=WALLS + .2, r=RSPK);
  // power button hole
  translate([W - MPAD - RPAD * 2 + RPWR + 5, (H - HSCR) / 2 + RPWR, T - WALLS - .1])
    cylinder(h=WALLS + .2, r=RPWR);
  // reset button hole
  translate([MPAD + RPAD * 2 - RRST, H - MPAD - RRST, T - WALLS - .1])
    cylinder(h=WALLS + .2, r=RRST);

  // down USB port
  // translate([W / 2, H + .1, 4.9])
  translate([9.9, WALLS + .1, 4.9])
    front_usb();
  // temp side USB port
  translate([-.1, 21.4, 4.9])
    rotate(90, [0, 0, 1])
      front_usb();
  // audio 3.5mm jack
  translate([22.5 + 1.5, WALLS + .1, 4.9])
    rotate(90, [1, 0, 0])
      cylinder(h=WALLS + .2, r=3.7 / 2 + 2);
  // SD card port
  AHSD = 2;
  AWSD = 1;
  AXSD = 1;
  AZSD = 1;
  translate([140 - AWSD + AXSD, -.1, 4.9 - AHSD - AZSD])
    cube([13 + AWSD * 2, 2, 1.5 + AHSD * 2]);
}

// A hole for a USB-C port.
module front_usb() {
  allowance = 2.5;
  rotate(90, [1, 0, 0])
    hull() {
      cylinder(h=2, r=1.5 + allowance);
      translate([9 - 2 * 1.5, 0, 0])
        cylinder(h=2, r=1.5 + allowance);
    }
}

// A little straigh corner keeping the display
// from moving to the sides.
module display_corner() {
  difference() {
    cube([3, 3, 2.7]);
    translate([1, 1, -1])
      cube([3, 3, 10]);
  }
}

// Additional reinforcement for the front panel
// to make it less flimsical when 3D-printed
// with not-so-sturdy plastic.
module extra_support() {
  width = 2;
  translate([WALLS, RB, T - WALLS - 2.5])
    cube([width, H - RB - RT, 2.5]);
  translate([RB, WALLS, T - WALLS - 2.5])
    cube([(W - WSCR) / 2 - RB - 10, width, 2.5]);
  hull() {
    translate([WALLS, 20, T - WALLS - 2.5])
      cube([width, 10, 2.5]);
    translate([20, WALLS, T - WALLS - 2.5])
      cube([10, width, 2.5]);
  }
}

module back_panel_cut() {
  back_panel_half_cut();
  translate([W, 0, 0])
    mirror([1, 0, 0])
      back_panel_half_cut();
}

module back_panel_half_cut() {
  WBEND = 22.393;
  WFLAT = 32; // Width of the flat surface on the side.
  WMID = W - (WFLAT + WBEND) * 2; // Width of the middle panel.

  translate([-1, -1, -10])
    cube([WFLAT + 2, H + 2, 10]);
  translate([WFLAT + .5, H + 1, -T - 5])
    rotate(90, [1, 0, 0])
      linear_extrude(H + 2)
        import(file="bend-cut.svg", layer="plate");
}

module front_columns() {
  // bottom-left screw column
  translate([MBCOL, MBCOL, T - WALLS - HCOL - .001])
    rotate(-45)
      screw_column_bottom();
  // bottom-right screw column
  translate([W - MBCOL, MBCOL, T - WALLS - HCOL - .001])
    rotate(45)
      screw_column_bottom();
  // top-left screw column
  translate([MTCOL, H - MTCOL, T - WALLS - HCOL - .001]) {
    screw_column_top();
  }
  // top-right screw column
  translate([W - MTCOL, H - MTCOL, T - WALLS - HCOL - .001]) {
    rotate(-90)
      screw_column_top();
  }
}

// A little column with a hollow shaft in the middle
// for a screw or bolt. Has a space for a nut. at the bottom.
// The height of the column control the distance between
// the front panel and PCB.
module screw_column_bottom() {
  difference() {
    cylinder(h=HCOL - HNUT, r=RCOL + 3);
    translate([0, 0, -.1])
      cylinder(h=HCOL + .2, r=RCOL);
  }

  translate([0, 0, HCOL - HNUT])
    difference() {
      cylinder(h=HNUT + .00001, r=RCOL + WALLS + RNUT);
      translate([-5, 0, -1])
        cube([10, (RCOL + WALLS + RNUT) * 2, 4]);
      translate([0, 0, -.1])
        cylinder(h=10, r=RCOL + RNUT);
    }
}

module screw_column_top() {
  difference() {
    translate([0, 0, 0])
      cylinder(h=HCOL - 1, r=RNUT);
    translate([0, 0, -.1])
      cylinder(h=HCOL + .2, r=RCOL, $fs=.2);
  }
}

module screw_column_support() {
  translate([0, 0, HCOL - WALLS])
    hull() {
      cylinder(h=WALLS, r=RCOL + WALLS + 1);
      translate([0, 3, 0])
        rotate(30)
          cube([(RCOL + WALLS + 1) * 2, 1, WALLS]);
      translate([-4, 0, 0])
        rotate(-120)
          cube([(RCOL + WALLS + 1) * 2, 1, WALLS]);
    }
}

front();
