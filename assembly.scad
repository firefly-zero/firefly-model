use <back.scad>;
use <front.scad>;
use <touchpad.scad>;
use <button-holder.scad>;
use <pcb.scad>;
use <display.scad>;
use <battery.scad>;

front();

translate([1, 1, 1])
  mirror([0, 0, 1])
    back();

translate([2, 2, 6.6])
  pcb();

translate([23.8, 37.2, 11])
  mirror([1, 1, 0])
    touchpad();

translate([143.2, 37.2, 12])
  mirror([0, 0, 1])
    button_holder();

translate([45, 3, 8.5])
  display();

translate([52.5, 3, -0.7])
  battery();
