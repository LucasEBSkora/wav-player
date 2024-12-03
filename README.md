# Wav-player
This repository contains the firmware and hardware description for a SoC capable of playing music from a SD-card with the capability of choosing the song/album through push buttons, and showing art for the specific song.

This project was done as part of the ``CONCEPTION ET DEVELOPPEMENT D'UN SYSTEME SUR PUCE'' module in Telecom Nancy's SLE major.

## Language and specs

This project is aimed at implementation on an ulx3s board. It is written in C and the Silice hardware description language. The code in this repository is strongly based on the example in [the Silice introduction project](https://github.com/sylefeb/Silice/tree/master/learn-silice/classroom/soc_wave_player)

This project uses submodules. Please clone it with
    git clone --recursive

or run
    git submodules init

after cloning