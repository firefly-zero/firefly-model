
module logo() {
  color("#f4f4f4")
    linear_extrude(height=1)
      import(file="logo.svg", layer="plate");
}

logo();
