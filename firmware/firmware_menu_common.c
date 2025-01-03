#include "firmware_menu_common.h"

#include "std.h"
#include "display.h"

#include "firmware_buttons.h"

extern void (*current_screen_function)();

char items[MENU_LENGTH][MENU_ITEM_LENGTH];
uint8 n_items;

static short int selected_album = 0;


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

static void show_album_select()
{
  while (1)
  {
    // show_menu(selected_album);
    album_menu_buttons();
  }
}

void change_to_album_select()
{
  load_itens(1);
  current_screen_function = &show_album_select;
}