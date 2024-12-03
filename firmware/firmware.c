#include "config.h"
#include "std.h"
#include "oled.h"
#include "display.h"
#include "printf.h"
#include "sdcard.h"

// include the fat32 library
#include "fat_io_lib/src/fat_filelib.h"


#define MAX_ITEMS 15
#define MAX_LEN   30

  const char items[MAX_ITEMS][MAX_LEN];
void main()
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
  while (fl_attach_media(sdcard_readsector, sdcard_writesector) != FAT_INIT_OK) {
    // keep trying, we need this
  }

  int selected = 0;
  int n_ents_current_dir = 0;
  int pulse = 0;

  const char *path = "/";
  FL_DIR dirstat;

  if (fl_opendir(path, &dirstat)) {
    struct fs_dir_ent dirent;
    while (fl_readdir(&dirstat, &dirent) == 0) {
      memcpy(items[n_ents_current_dir++], dirent.filename, MAX_LEN);
    }
    fl_closedir(&dirstat);
  }
  
  while (1) {
    display_set_cursor(0,0);
    // pulsing header
    display_set_front_back_color((pulse+127)&255,pulse);
    pulse += 7;
    printf("    ===== files =====    \n\n");
    // list items
    for (int i = 0; i < n_ents_current_dir; ++i) {
      if (i == selected) { // highlight selected
        display_set_front_back_color(0,255);
      } else {
        display_set_front_back_color(255,0);
      }
      printf("> %s\n",i,items[i]);
    }
    display_refresh();

        if (*BUTTONS & (1<<3)) {
      ++ selected;
    }
    if (*BUTTONS & (1<<4)) {
      -- selected;
    }
    // wrap around
    if (selected < 0) {
      selected = n_ents_current_dir - 1;
    }
    if (selected >= n_ents_current_dir) {
      selected = 0;
    }
  }


}
