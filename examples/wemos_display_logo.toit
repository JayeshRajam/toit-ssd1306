// Copyright (C) 2020 Toitware ApS. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import font show *
import pixel_display show *
import texture show *
import two_color show *
import bitmap show *

TOITWARE_LOGO ::= #[
  0x50, 0x34, 0x0a, 0x23, 0x20, 0x43, 0x52, 0x45, 0x41, 0x54, 0x4f, 0x52, 0x3a, 0x20, 0x47, 0x49,
  0x4d, 0x50, 0x20, 0x50, 0x4e, 0x4d, 0x20, 0x46, 0x69, 0x6c, 0x74, 0x65, 0x72, 0x20, 0x56, 0x65,
  0x72, 0x73, 0x69, 0x6f, 0x6e, 0x20, 0x31, 0x2e, 0x31, 0x0a, 0x31, 0x30, 0x35, 0x20, 0x36, 0x34,
  0x0a, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0b, 0x00, 0x7f,
  0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x80, 0xff, 0xfc, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1f, 0xff, 0x80, 0x7f, 0xff, 0xe0, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xff, 0xff, 0x80, 0x7f, 0xff, 0xfe, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x3f, 0xff, 0xff, 0x80, 0x0f, 0xff, 0xff, 0xe8, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x03, 0xff, 0xff, 0xfc, 0x00, 0x00, 0xff, 0xff, 0xff, 0x80, 0x00, 0x00, 0x00, 0x00, 0x7f, 0xff,
  0xff, 0x80, 0x00, 0x00, 0x0b, 0xff, 0xff, 0xfc, 0x00, 0x00, 0x00, 0x17, 0xff, 0xff, 0xf8, 0x00,
  0x00, 0x00, 0x00, 0x5f, 0xff, 0xff, 0xc0, 0x00, 0x01, 0x7f, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x01, 0xff, 0xff, 0xfe, 0x00, 0x1f, 0xff, 0xff, 0xd0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x1f, 0xff, 0xff, 0xeb, 0xff, 0xff, 0xfd, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff,
  0xff, 0xff, 0xff, 0xff, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0xff,
  0xff, 0xf8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7f, 0xff, 0xff, 0x80,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xff, 0xf8, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xff, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x7f, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x7f, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x3f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3f,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3e, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x3e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x3f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3f,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7f, 0x80, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7f, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x01, 0xff, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x01, 0xff, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x03, 0xff, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xff,
  0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xe1, 0xf8, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0f, 0xe1, 0xfc, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x00, 0x1f, 0xc0, 0xfc, 0x00, 0x00, 0x00, 0x00, 0x07,
  0x00, 0x7c, 0x00, 0x00, 0x00, 0x00, 0x1f, 0x80, 0x7e, 0x00, 0x00, 0x00, 0x00, 0x0f, 0x80, 0xfe,
  0x00, 0x00, 0x00, 0x00, 0x3f, 0x80, 0x7f, 0x00, 0x00, 0x00, 0x00, 0x1f, 0x80, 0x7f, 0x00, 0x00,
  0x00, 0x00, 0x7f, 0x00, 0x3f, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x80, 0x3f, 0x80, 0x00, 0x00, 0x00,
  0x7e, 0x00, 0x1f, 0x80, 0x00, 0x00, 0x00, 0x7f, 0x00, 0x3f, 0xc0, 0x00, 0x00, 0x00, 0xfe, 0x00,
  0x1f, 0xc0, 0x00, 0x00, 0x00, 0xfe, 0x00, 0x0f, 0xe0, 0x00, 0x00, 0x01, 0xfc, 0x00, 0x0f, 0xe0,
  0x00, 0x00, 0x01, 0xfe, 0x00, 0x0f, 0xf0, 0x00, 0x00, 0x01, 0xf8, 0x00, 0x07, 0xe0, 0x00, 0x00,
  0x03, 0xf8, 0x00, 0x07, 0xf8, 0x00, 0x00, 0x03, 0xf8, 0x00, 0x07, 0xf0, 0x00, 0x00, 0x07, 0xf0,
  0x00, 0x03, 0xfc, 0x00, 0x00, 0x07, 0xf0, 0x00, 0x03, 0xf0, 0x00, 0x00, 0x0f, 0xe0, 0x00, 0x01,
  0xfe, 0x00, 0x00, 0x07, 0xe0, 0x00, 0x01, 0xf8, 0x00, 0x00, 0x1f, 0xe0, 0x00, 0x00, 0xff, 0x00,
  0x00, 0x0f, 0xc0, 0x00, 0x01, 0xfc, 0x00, 0x00, 0x3f, 0x80, 0x00, 0x00, 0x7f, 0x80, 0x00, 0x1f,
  0xc0, 0x00, 0x00, 0xfe, 0x00, 0x00, 0x7f, 0x80, 0x00, 0x00, 0x3f, 0xc0, 0x00, 0x1f, 0x80, 0x00,
  0x00, 0x7e, 0x00, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x1f, 0xe0, 0x00, 0x3f, 0x00, 0x00, 0x00, 0x7f,
  0x00, 0x01, 0xfe, 0x00, 0x00, 0x00, 0x0f, 0xf0, 0x00, 0x7f, 0x00, 0x00, 0x00, 0x3f, 0x80, 0x03,
  0xfc, 0x00, 0x00, 0x00, 0x07, 0xf8, 0x00, 0x7e, 0x00, 0x00, 0x00, 0x1f, 0x80, 0x07, 0xf0, 0x00,
  0x00, 0x00, 0x03, 0xfc, 0x00, 0xfc, 0x00, 0x00, 0x00, 0x1f, 0xc0, 0x0f, 0xf0, 0x00, 0x00, 0x00,
  0x01, 0xfe, 0x03, 0xfc, 0x00, 0x00, 0x00, 0x0f, 0xf0, 0x1f, 0xe0, 0x00, 0x00, 0x00, 0x00, 0xff,
  0xdf, 0xf8, 0x00, 0x00, 0x00, 0x07, 0xfe, 0xff, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x7f, 0xff, 0xf0,
  0x00, 0x00, 0x00, 0x03, 0xff, 0xff, 0x80, 0x00, 0x00, 0x00, 0x00, 0x3f, 0xff, 0xe0, 0x00, 0x00,
  0x00, 0x03, 0xff, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1f, 0xff, 0xc0, 0x00, 0x00, 0x00, 0x00,
  0xff, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7f, 0xf8,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x40, 0x00, 0x00,
  0x00]

main:
  oled := TwoColorPixelDisplay "ssd1306"

  oled.background = BLACK

  logobg := PbmTexture 0 0 oled.landscape WHITE TOITWARE_LOGO
  oled.add logobg

  frame := RoundedCornerWindow 8 8 112 48 oled.landscape 17 BLACK
  oled.add frame

  window := RoundedCornerWindow 10 10 108 44 oled.landscape 15 WHITE
  oled.add window

  logo := OpaquePbmTexture 0 0 oled.landscape TOITWARE_LOGO
  window.add logo

  while true:
    200.repeat:
      i := it < 100 ? it : 200 - it
      logo.move_to i (i / 8)
      logobg.move_to 100 - i ((100 - i) / 8)
      oled.draw