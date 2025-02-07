#include "firmware_song_player.h"

#include "fat_io_lib/src/fat_filelib.h"
#include "firmware_menu_common.h"
#include "display.h"
#include "oled.h"

extern void (*current_screen_function)();

FL_FILE *f;
static const char* song_path;

static void show_screen()
{
    display_set_cursor(0, 128);
    display_set_front_back_color(0, 255);
    printf(song_path);
    display_refresh();
}

static void play_song()
{

}

static void show_song_player()
{
    show_screen();
    play_song();
}

static void load_song(int selected_song)
{
    song_path = get_song_path(selected_song);
    f = fl_fopen(get_song_path(selected_song), "rb");
}

void change_to_song_player(int selected_song)
{
    load_song(selected_song);
    oled_clear(0);
    current_screen_function = &show_song_player;
}

void change_to_song_player_album(int selected_album)
{
}
