set -e

mkdir -p stl
echo "back"
openscad -o stl/back.stl                models/back.scad
echo "battery"
openscad -o stl/battery.stl             models/battery.scad
echo "button-holder"
openscad -o stl/button-holder.stl       models/button-holder.scad
echo "button"
openscad -o stl/button.stl              models/button.scad
echo "display"
openscad -o stl/display.stl             models/display.scad
echo "front"
openscad -o stl/front.stl               models/front.scad
echo "logo"
openscad -o stl/logo.stl                models/logo.scad
echo "lucy-locks"
openscad -o stl/lucy-locks.stl          models/lucy-locks.scad
echo "pcb"
openscad -o stl/pcb.stl                 models/pcb.scad
echo "power-button"
openscad -o stl/power-button.stl        models/power-button.scad
echo "simplified-button"
openscad -o stl/simplified-button.stl   models/simplified-button.scad
echo "speaker"
openscad -o stl/speaker.stl             models/speaker.scad
echo "touchpad"
openscad -o stl/touchpad.stl            models/touchpad.scad
echo "translucy"
openscad -o stl/translucy.stl           models/translucy.scad
