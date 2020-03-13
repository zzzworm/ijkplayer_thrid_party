message("arch abi = ${CMAKE_ANDROID_ARCH_ABI}")

message("include the ijk.cmake start")
file(GLOB IJK_SRC cpp/*.c cpp/*.cpp)
message("c files: ${IJK_SRC}")
#add_library(ijkplayer SHARED ${IJK_SRC})
add_library(ijkffmpeg SHARED IMPORTED)
set_target_properties(ijkffmpeg PROPERTIES IMPORTED_LOCATION ${FFMPEG_PATH})

message("ijk media path = ${IJK_PATH}/ijkmedia")
add_subdirectory(${IJK_PATH}/ijkmedia ijkmedia)

message("include the ijk.cmake end")
