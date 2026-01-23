$fs = .2;

NUT_D = 4.37;
NUT_H = 1.53;
HEAD_D = 3.58;
HEAD_H = 1.54;
SHAFT_D = 1.90;

SHAFT_H = 12.07;

module bolt() {
  difference() {
    union() {
      cylinder(h=SHAFT_H, r=SHAFT_D / 2);
      translate([0, 0, SHAFT_H - HEAD_H])
        cylinder(h=HEAD_H, r=HEAD_D / 2);
      cylinder(h=NUT_H, r=NUT_D / 2, $fs=2.5);
    }
    translate([0, 0, SHAFT_H - HEAD_H + 1.4]) {
      cylinder(h=1, r=(HEAD_D - 1) / 2, $fs=1.5);
    }
  }
}

bolt();
