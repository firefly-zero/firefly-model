$fs = .2;

NUT_D = 4.37;
NUT_H = 1.53;
HEAD_D = 3.82;
HEAD_H = 1.54;
SHAFT_D = 1.90;
SHAFT_H = 11.35;

module bolt() {
  difference() {
    union() {
      cylinder(h=SHAFT_H, r=SHAFT_D / 2);
      translate([0, 0, SHAFT_H - HEAD_H])
        cylinder(h=HEAD_H, r=HEAD_D / 2);
      cylinder(h=NUT_H, r=NUT_D / 2, $fs=2.5);
    }
    translate([0, -1, SHAFT_H - HEAD_H]) {
      translate([-.5 / 2, 0, HEAD_H - .1])
        cube([.5, 2, 2]);
      translate([-1, .75, HEAD_H - .1])
        cube([2, .5, 2]);
    }
  }
}

bolt();
