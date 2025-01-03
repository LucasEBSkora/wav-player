#include "firmware_menu_common.h"

#include "std.h"
#include "display.h"

#include "firmware_buttons.h"

char items[MENU_LENGTH][MENU_ITEM_LENGTH];
uint8 n_items;

void load_items(uint8 album_mode)
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