#include "firmware_song_player.h"
#include "std.h"
#include "fat_io_lib/src/fat_filelib.h"
#include "firmware_menu_common.h"
#include "display.h"
#include "oled.h"
#include "firmware_song_menu.h"
#include "firmware_buttons.h"

extern void (*current_screen_function)();
extern void (*audio_function)();


FL_FILE *f;
static const char *song_path;

int paused = 0;

static void show_screen()
{
  display_set_cursor(0, 128);
  display_set_front_back_color(0, 255);
  printf(song_path);
  if (f != NULL)
  {
    printf("\nplaying...\n");
  }
  display_refresh();
}

static void stop_player()
{
  fl_fclose(f);
  return_to_song_select();
}

static void play_song()
{
  int *addr = (int *)(*AUDIO);
  int sz = fl_fread(addr, 1, 512, f);
  if (sz < 512)
  {
    stop_player();
    return;
  }
  // wait for buffer swap
  while (addr == (int *)(*AUDIO))
    ;
}

static void player_buttons()
{
  if (button_pressed(BUTTON_DOWN))
  {
    paused = !paused;
    if (paused)
    {
      audio_function = &clear_audio;
    }
    else
    {
      audio_function = &play_song;
    }
  }
  if (button_pressed(BUTTON_UP))
  {
  }
  if (button_pressed(BUTTON_LEFT))
  {
    stop_player();
  }
  if (button_pressed(BUTTON_RIGHT))
  {
  }
  volume_buttons(1);
}

static void show_song_player()
{
  show_screen();
  play_song();
  player_buttons();
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
  audio_function = &play_song;
}

void change_to_song_player_album(int selected_album)
{
}

void clear_audio()
{
  int *addr = (int *)(*AUDIO);
  memset(addr, 0, 512);
  while (addr == (int *)(*AUDIO))
    ;
}
