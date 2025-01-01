#include "config.h"
#include "std.h"
#include "oled.h"
#include "display.h"
#include "printf.h"
#include "sdcard.h"

// include the fat32 library
#include "fat_io_lib/src/fat_filelib.h"

#include "firmware_buttons.h"

#define MAX_MENU_ITEMS_SHOWN 6

#define MENU_LENGTH 20
#define MENU_ITEM_LENGTH 30

#define MIN(X, Y) (X <= Y ? X : Y)

char items[MENU_LENGTH][MENU_ITEM_LENGTH];
uint8 n_items;

short int selected_album = 0;
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

void load_itens(uint8 album_mode)
{

  const char *path = "/";
  FL_DIR dirstat;

  n_items = 0;

  if (fl_opendir(path, &dirstat))
  {
    struct fs_dir_ent dirent;
    while (fl_readdir(&dirstat, &dirent) == 0)
    {
      if (album_mode)
      {
        if (dirent.is_dir)
        {
          strncpy(items[n_items++], dirent.filename, MENU_ITEM_LENGTH);
        }
      }
      else
      {
        size_t name_len = strlen(dirent.filename);
        if (!dirent.is_dir && name_len > 4 && strncmp(dirent.filename + (name_len - 4), ".wav", 4) == 0)
        {
          name_len = MIN(MENU_ITEM_LENGTH, name_len - 4);

          strncpy(items[n_items], dirent.filename, name_len);
          items[n_items++][name_len] = '\0';
        }
      }
    }
    fl_closedir(&dirstat);
  }
}

void show_menu(uint8 index)
{
  display_set_cursor(0, 0);
  display_set_front_back_color(0, 255);
  printf("    ===== albums =====    \n\n");
  for (int i = 0; i < n_items; ++i)
  {
    if (i == index)
    {
      display_set_front_back_color(0, 255);
    }
    else
    {
      display_set_front_back_color(255, 0);
    }
    printf("%d - %s\n", i, items[i]);
  }
  display_refresh();
}

void album_menu_buttons()
{
  if (BUTTON_PRESSED(BUTTON_DOWN))
  {
    if (selected_album == n_items - 1)
      selected_album = 0;
    else
      ++selected_album;
  }
  if (BUTTON_PRESSED(BUTTON_UP))
  {
    if (selected_album == 0)
      selected_album = n_items - 1;
    else
      --selected_album;
  }
  if (BUTTON_PRESSED(BUTTON_LEFT))
  {
    if (selected_album == 0)
      selected_album = n_items - 1;
    else
      --selected_album;
  }
  volume_buttons();
}

void show_album_select()
{
  while (1)
  {
    show_menu(selected_album);
    album_menu_buttons();
  }
}

void change_to_album_select()
{
  load_itens(1);
  current_screen_function = &show_album_select;
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
