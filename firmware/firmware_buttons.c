#include "firmware_buttons.h"
#include "config.h"

extern int pwm_audio_high;

void volume_buttons()
{
    if (BUTTON_PRESSED(BUTTON_MINUS))
    {
        if (pwm_audio_high > 0)
            --pwm_audio_high;
    }
    if (BUTTON_PRESSED(BUTTON_PLUS))
    {
        if (pwm_audio_high < 15)
            ++pwm_audio_high;
    }
    *PWM_MAX = pwm_audio_high;
}