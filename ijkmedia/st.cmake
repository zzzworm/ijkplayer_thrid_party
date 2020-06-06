message("run in soundtouch")

#
# Copyright (c) 2019 Befovy <befovy@gmail.com>
#
# This file is part of fijkPlayer.
#
# hijkPlayer is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# hijkPlayer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with ijkPlayer; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
#
cmake_minimum_required(VERSION 3.6)

include_directories(${CMAKE_CURRENT_LIST_DIR})
include_directories(${CMAKE_CURRENT_LIST_DIR}/..)
include_directories(${CMAKE_CURRENT_LIST_DIR}/include/)

set(SOUND_THOCH_SOURCES
    source/SoundTouch/AAFilter.cpp
    source/SoundTouch/FIFOSampleBuffer.cpp
    source/SoundTouch/FIRFilter.cpp
    source/SoundTouch/cpu_detect_x86.cpp
    source/SoundTouch/sse_optimized.cpp
    source/SoundTouch/RateTransposer.cpp
    source/SoundTouch/InterpolateCubic.cpp
    source/SoundTouch/InterpolateLinear.cpp
    source/SoundTouch/InterpolateShannon.cpp
    source/SoundTouch/TDStretch.cpp
    source/SoundTouch/BPMDetect.cpp
    source/SoundTouch/PeakFinder.cpp
    source/SoundTouch/SoundTouch.cpp
    source/SoundTouch/mmx_optimized.cpp
    ijksoundtouch_wrap.cpp
)

add_library(ijksoundtouch STATIC ${SOUND_THOCH_SOURCES})