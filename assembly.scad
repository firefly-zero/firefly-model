use <back.scad>;
use <front.scad>;
use <touchpad.scad>;
use <button-holder.scad>;
use <pcb.scad>;
use <display.scad>;
use <battery.scad>;
use <speaker.scad>;
use <button.scad>;

front();

translate([166, 1, 1])
  rotate(180, [0, 1, 0])
    back();

translate([2, 2, 6.6])
  pcb();

translate([23.8, 37.2, 11])
  mirror([1, 1, 0])
    touchpad();

translate([37, 10.5, 10])
  speaker();

translate([143.2, 37.2, 12])
  mirror([0, 0, 1])
    button_holder();

// W
translate([134, 37.2, 11]) {
  button();
  power_button();
}
// E
translate([152.5, 37.2, 11]) {
  button();
  power_button();
}
// S
translate([143.2, 28, 11]) {
  button();
  power_button();
}
// N
translate([143.2, 46.5, 11]) {
  button();
  power_button();
}
// reset
translate([135.1, 10.5, 11])
  power_button();

translate([45, 3, 8.5])
  display();

translate([52.5, 3, -0.7])
  battery();
