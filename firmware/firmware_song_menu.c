#include "firmware_song_menu.h"

#include "firmware_buttons.h"
#include "firmware_menu_common.h"
#include "firmware_song_player.h"

extern void (*current_screen_function)();
static short int selected_song = 0;

void change_to_album_select();

void song_menu_buttons()
{
    if (BUTTON_PRESSED(BUTTON_DOWN))
    {
        if (selected_song == n_items - 1)
            selected_song = 0;
        else
            ++selected_song;
    }
    if (BUTTON_PRESSED(BUTTON_UP))
    {
        if (selected_song == 0)
            selected_song = n_items - 1;
        else
            --selected_song;
    }
    if (BUTTON_PRESSED(BUTTON_LEFT))
    {
        change_to_album_select();
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT))
    {
        change_to_song_player(selected_song);
    }
    volume_buttons();
}

static void show_song_select()
{
    while (1)
    {
        show_menu(selected_song);
        song_menu_buttons();
    }
}

void change_to_song_select(int selected_album)
{
    load_items(0);
    current_screen_function = &show_song_select;
}