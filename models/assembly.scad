use <back.scad>;
use <battery.scad>;
use <button-holder.scad>;
use <button.scad>;
use <display.scad>;
use <front.scad>;
use <pcb.scad>;
use <simplified-button.scad>;
use <speaker.scad>;
use <touchpad.scad>;
use <translucy.scad>;
use <lucy-locks.scad>;

front();

lucy_locks();

color("purple")
  translate([166, 1, 1])
    rotate(180, [0, 1, 0])
      back();

translate([2, 2, 6.6])
  pcb();

// translate([-68.61, 127.4, 6.5])
//   color("green")
//     import("./pcb.stl");

translate([23.8, 37.2, 11])
  mirror([1, 1, 0])
    touchpad();

translate([37, 10.5, 10])
  speaker();

translate([143.2, 37.2, 12])
  mirror([0, 0, 1])
    button_holder();

color("#333c57") {
  // W
  // translate([134, 37.2, 11]) {
  //   button();
  //   power_button();
  // }
  translate([134, 37.2, 11 + .5])
    simplified_button();
  // E
  // translate([152.5, 37.2, 11]) {
  //   button();
  //   power_button();
  // }
  translate([152.5, 37.2, 11 + .5])
    simplified_button();
  // S
  // translate([143.2, 28, 11]) {
  //   button();
  //   power_button();
  // }
  translate([143.2, 28, 11 + .5])
    simplified_button();
  // N
  // translate([143.2, 46.5, 11]) {
  //   button();
  //   power_button();
  // }
  translate([143.2, 46.5, 11 + .5])
    simplified_button();
}
// menu
// translate([135.1, 10.5, 11])
//   power_button();
translate([135.1, 10.5, 11 + .5])
  simplified_button();

translate([44, 3, 8.5])
  display();

translate([52.5, 10, -0.7])
  battery();

translate([47, 0, 6])
  translucy();

translate([47, 61, 6])
  mirror([0, 1, 0])
    translucy();
