#!/usr/bin/env bash

./compile-x264.sh clean
./compile-ffmpeg.sh clean

./compile-x264.sh all
./compile-ffmpeg.sh all