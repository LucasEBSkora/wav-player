#include "config.h"
#include "std.h"
#include "oled.h"
#include "display.h"
#include "printf.h"
#include "sdcard.h"

#include "fat_io_lib/src/fat_filelib.h"

#include "firmware_buttons.h"
#include "firmware_menu_common.h"

short int selected_song = 0;

int pwm_audio_high = 8;

void (*current_screen_function)() = NULL;

void init()
{
  // turn LEDs off
  *LEDS = 0;
  // install putchar handler for printf
  f_putchar = display_putchar;
  // init screen
  oled_init();
  oled_fullscreen();
  oled_clear(0);
  // init sdcard
  sdcard_init();
  // initialise File IO Library
  fl_init();
  // attach media access functions to library
  while (fl_attach_media(sdcard_readsector, sdcard_writesector) != FAT_INIT_OK)
    ;
}


void main()
{
  init();

  change_to_album_select();
  while (1)
  {
    (*current_screen_function)();
  }
}
