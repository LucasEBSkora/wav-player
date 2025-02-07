#ifndef __FIRMWARE_BUTTONS_H__
#define __FIRMWARE_BUTTONS_H__

#include "config.h"

#define BUTTON_MINUS (1 << 1)
#define BUTTON_PLUS (1 << 2)
#define BUTTON_UP (1 << 3)
#define BUTTON_DOWN (1 << 4)
#define BUTTON_LEFT (1 << 5)
#define BUTTON_RIGHT (1 << 6)

void volume_buttons();
void update_buttons();
int button_pressed(int button_code);

#endif