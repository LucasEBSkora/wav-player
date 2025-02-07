#ifndef __FIRMWARE_MENU_COMMON_H__
#define __FIRMWARE_MENU_COMMON_H__

#include "fat_io_lib/src/fat_filelib.h"

#define MAX_MENU_ITEMS_SHOWN 6

#define MENU_LENGTH 10
#define MENU_ITEM_LENGTH 30

#define MIN(X, Y) (X <= Y ? X : Y)

extern char items[MENU_LENGTH][MENU_ITEM_LENGTH];
extern uint8 n_items;

void load_items(uint8 album_mode, uint8 selected);
void show_menu(uint8 index, const char* title);
const char* get_song_path(int selected);

#endif