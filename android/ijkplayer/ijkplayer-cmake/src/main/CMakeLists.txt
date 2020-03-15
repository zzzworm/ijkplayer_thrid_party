cmake_minimum_required(VERSION 3.10.2)

project("FlutterIJK")

#set(USE_SHELL 1)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 11)
set(ANDROID_PLATFORM_LEVEL 16)

# 设置一个更短的ABI以便于运行
set(ABI ${CMAKE_ANDROID_ARCH_ABI})
message("FFMPEG_OUT ${FFMPEG_OUT}")
message("ABI ${ABI}")

# 通过ijkplayer自带脚本编译的so路径
set(FFMPEG_PATH "${FFMPEG_OUT}/${ABI}/libijkffmpeg.so")
set(IJK_SDL_PATH "${FFMPEG_OUT}/${ABI}/libijksdl.so")
set(IJK_PLAYER_PATH "${FFMPEG_OUT}/${ABI}/libijkplayer.so")
set(JNI_LIB_PATH "${CMAKE_CURRENT_SOURCE_DIR}/jniLibs/${ABI}")

# 删除旧的,添加新的,以防止切换so和shell打包方式时会出现多种so来源的问题
#file(MAKE_DIRECTORY ${JNI_LIB_PATH})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${ANROID_PROJECT_PATH}/so/${ABI}")
file(COPY ${FFMPEG_PATH} DESTINATION ${JNI_LIB_PATH})
file(COPY ${FFMPEG_PATH} DESTINATION ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})

message("cmake so out path : ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")

if (${USE_SHELL})
    # 传统编译方式的话, 把ijkplayer的so复制进来
    message("ijkplayer compile type:  use the shell compile so library")
    file(COPY ${IJK_PLAYER_PATH} DESTINATION ${JNI_LIB_PATH})
    file(COPY ${IJK_SDL_PATH} DESTINATION ${JNI_LIB_PATH})
else ()
    # 源码引入
    file(REMOVE "${JNI_LIB_PATH}/libijkplayer.so")
    message("ijkplayer compile type:  use source to compile ijkplayer")
    include("${CMAKE_CURRENT_SOURCE_DIR}/ijk.cmake")
endif ()
