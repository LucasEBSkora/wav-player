#ifndef __FIRMWARE_BUTTONS_H__
#define __FIRMWARE_BUTTONS_H__

#define BUTTON_MINUS (1 << 1)
#define BUTTON_PLUS (1 << 2)
#define BUTTON_UP (1 << 3)
#define BUTTON_DOWN (1 << 4)
#define BUTTON_LEFT (1 << 5)
#define BUTTON_RIGHT (1 << 6)

#define BUTTON_PRESSED(button_code) (*BUTTONS & button_code)

void volume_buttons();

#endif