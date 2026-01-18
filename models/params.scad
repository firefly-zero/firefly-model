// Abbreviations:
//   * A: allowance
//   * B: bottom
//   * D: diameter
//   * H: height
//   * L: left
//   * M: margin
//   * R: radius
//   * R: right
//   * T: thickness / top
//   * W: width

// Component sizes that can be changed.
SCREEN_W = 73;
SCREEN_H = 49;
TOUCHPAD_D = 35;

// Design sizes that can be changed.
SCREEN_A = 0;
SCREEN_MT = 6;
TOUCHPAD_A = .45 / 2;
TOUCHPAD_ML = 6;
POWER_BUTTON_D = 9;
POWER_BUTTON_A = .1;

// Calculated sizes that can be changed.
TOUCHPAD_MR = TOUCHPAD_ML;
SCREEN_MB = SCREEN_MT;
BUTTONER_D = TOUCHPAD_D;
BUTTONER_ML = TOUCHPAD_MR;
BUTTONER_MR = TOUCHPAD_ML;
BUTTON_D = POWER_BUTTON_D;
BUTTON_A = POWER_BUTTON_A;

// Calculated sizes that cannot be changed.
CASE_W = TOUCHPAD_ML + TOUCHPAD_D + TOUCHPAD_MR + SCREEN_W + BUTTONER_ML + BUTTONER_D + BUTTONER_MR;
CASE_H = SCREEN_MT + SCREEN_H + SCREEN_MB;

// Radius is half-diameter (advanced math here for you).
TOUCHPAD_R = TOUCHPAD_D / 2;
BUTTONER_R = BUTTONER_D / 2;
POWER_BUTTON_R = POWER_BUTTON_D / 2;
BUTTON_R = BUTTON_D / 2;
