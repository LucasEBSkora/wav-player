# Wav-player
This repository contains the firmware and hardware description for a SoC capable of playing music from a SD-card with the capability of choosing the song/album through push buttons, and showing art for the specific song.

This project was done as part of the ``CONCEPTION ET DEVELOPPEMENT D'UN SYSTEME SUR PUCE'' module in Telecom Nancy's SLE major.

## Language and specs

This project is aimed at implementation on an ulx3s board. It is written in C and the Silice hardware description language. The code in this repository is strongly based on the example in [the Silice introduction project](https://github.com/sylefeb/Silice/tree/master/learn-silice/classroom/soc_wave_player), by which I mean that almost all files were copied with little to no alterations.

This project uses submodules. Please clone it with
    git clone --recursive git@github.com:LucasEBSkora/wav-player.git

or run
    git submodule update --init --recursive

after cloning

## How to use
Songs must be grouped in albums with file names ending in ".raw". To enter an album, use the right button, and to play a song, use the right button. To pick the song/album, use the up and down buttons, and to exit an album, use the left button. You can also use B1 to decrease the volume and B2 to increase it. The volume level is shown on the LEDs.