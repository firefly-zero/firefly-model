set -e

mkdir -p stl
echo "back"
openscad -o stl/back.stl                models/back.scad
echo "battery"
openscad -o stl/battery.stl             models/battery.scad
echo "button-holder"
openscad -o stl/button-holder.stl       models/button-holder.scad
echo "corner"
openscad -o stl/corner.stl              models/corner.scad
echo "display"
openscad -o stl/display.stl             models/display.scad
echo "front"
openscad -o stl/front.stl               models/front.scad
echo "logo"
openscad -o stl/logo.stl                models/logo.scad
echo "pcb"
openscad -o stl/pcb.stl                 models/pcb.scad
echo "simplified-button"
openscad -o stl/simplified-button.stl   models/simplified-button.scad
echo "speaker"
openscad -o stl/speaker.stl             models/speaker.scad
echo "touchpad"
openscad -o stl/touchpad.stl            models/touchpad.scad
