#include "firmware_song_menu.h"

#include "firmware_buttons.h"
#include "firmware_menu_common.h"
#include "firmware_song_player.h"

#include "oled.h"

extern void (*current_screen_function)();
extern void (*audio_function)();
static short int selected_song = 0;

void change_to_album_select();

void song_menu_buttons()
{
    if (button_pressed(BUTTON_DOWN))
    {
        if (selected_song == n_items - 1)
            selected_song = 0;
        else
            ++selected_song;
    }
    if (button_pressed(BUTTON_UP))
    {
        if (selected_song == 0)
            selected_song = n_items - 1;
        else
            --selected_song;
    }
    if (button_pressed(BUTTON_LEFT))
    {
        change_to_album_select();
    }
    if (button_pressed(BUTTON_RIGHT))
    {
        change_to_song_player(selected_song);
    }
    volume_buttons();
}

static void show_song_select()
{
    show_menu(selected_song, "songs");
    song_menu_buttons();
}

void change_to_song_select(int selected_album)
{
    load_items(0, selected_album);
    if (selected_song > n_items) {
        selected_song = 0;
    }
    oled_clear(0);
    current_screen_function = &show_song_select;
}

void return_to_song_select() {
    oled_clear(0);
    current_screen_function = &show_song_select;
    audio_function = &clear_audio;
}