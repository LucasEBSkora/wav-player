#ifndef __FIRMWARE_MENU_COMMON_H__
#define __FIRMWARE_MENU_COMMON_H__

#include "fat_io_lib/src/fat_filelib.h"

#define MAX_MENU_ITEMS_SHOWN 6

#define MENU_LENGTH 20
#define MENU_ITEM_LENGTH 30

#define MIN(X, Y) (X <= Y ? X : Y)

void load_itens(uint8 album_mode);
void show_menu(uint8 index);
void change_to_album_select();

extern char items[MENU_LENGTH][MENU_ITEM_LENGTH];
extern uint8 n_items;
#endif