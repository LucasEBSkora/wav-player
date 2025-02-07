#include "firmware_buttons.h"
extern int pwm_audio_high;

void volume_buttons()
{
    if (button_pressed(BUTTON_MINUS))
    {
        if (pwm_audio_high > 0)
            --pwm_audio_high;
        else
            pwm_audio_high = 0;
    }
    if (button_pressed(BUTTON_PLUS))
    {
        if (pwm_audio_high < 15)
            ++pwm_audio_high;
        else
            pwm_audio_high = 15;
    }
    *PWM_MAX = pwm_audio_high;
}

static int last_buttons = 0;
static int pressed_buttons;

void update_buttons()
{
    pressed_buttons = *BUTTONS & ~last_buttons;
    last_buttons = *BUTTONS;
}

int button_pressed(int button_code)
{
    return pressed_buttons & button_code;
}