message("include the ijk.cmake start")
file(GLOB IJK_SRC cpp/*.c cpp/*.cpp)
message("c files: ${IJK_SRC}")
add_library(ijkplayer SHARED ${IJK_SRC})
message("include the ijk.cmake end")