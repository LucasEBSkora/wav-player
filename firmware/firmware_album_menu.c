#include "firmware_album_menu.h"

#include "firmware_buttons.h"
#include "firmware_menu_common.h"

extern void (*current_screen_function)();
static short int selected_album = 0;

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
        show_menu(selected_album);
        album_menu_buttons();
    }
}

void change_to_album_select()
{
    load_items(1);
    current_screen_function = &show_album_select;
}