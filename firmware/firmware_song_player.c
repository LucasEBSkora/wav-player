#include "firmware_song_player.h"

#include "fat_io_lib/src/fat_filelib.h"
#include "firmware_menu_common.h"
#include "display.h"
#include "oled.h"
#include "firmware_song_menu.h"
#include "firmware_buttons.h"
extern void (*current_screen_function)();

extern int pwm_audio_high;

FL_FILE *f;
static const char* song_path;

static void show_screen()
{
    display_set_cursor(0, 128);
    display_set_front_back_color(0, 255);
    printf(song_path);
    if (f != NULL) {
        printf("\nplaying...\n");
    }
    display_refresh();
}

static void play_song()
{
    // plays the entire file
    while (1) {
      // read directly in hardware buffer
      int *addr = (int*)(*AUDIO);
      // (use 512 bytes reads to avoid extra copies inside fat_io_lib)
      int sz = fl_fread(addr,1,512,f);
      if (sz < 512) break; // reached end of file
      // wait for buffer swap
      while (addr == (int*)(*AUDIO)) { }
      update_buttons();
      volume_buttons();
    }
    // close
    fl_fclose(f);
    return_to_song_select();
}

static void show_song_player()
{
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
    show_screen();
    *PWM_MAX = pwm_audio_high;
    play_song();
}

void change_to_song_player_album(int selected_album)
{
}
