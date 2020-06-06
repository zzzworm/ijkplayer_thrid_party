message("cmake for IjkMedia, ${Android}")

add_subdirectory(ijkplayer)
add_subdirectory(ijksdl)

if (Android)
    # file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/st.cmake ${CMAKE_CURRENT_SOURCE_DIR}/ijksoundtouch/CMakeLists.txt)
    # file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/yuv.cmake ${CMAKE_CURRENT_SOURCE_DIR}/ijkyuv/CMakeLists.txt)
    add_subdirectory(ijkj4a)
    add_subdirectory(ijkyuv)
    add_subdirectory(ijksoundtouch)

    add_subdirectory(../ijkprof/android-ndk-profiler-dummy/jni ijkprof)

endif ()