#! /usr/bin/env bash

FMK_NAME="IJKMediaFramework"

INSTALL_DIR=${SRCROOT}/Products/${FMK_NAME}.framework

# Working dir will be deleted after the framework creation.

RE_OS="Release-iphoneos"
RE_SIMULATOR="Release-iphonesimulator"


DEVICE_DIR=${SRCROOT}/../${FMK_NAME}/Products/$RE_OS/
SIMULATOR_DIR=${SRCROOT}/../${FMK_NAME}/Products/$RE_SIMULATOR/

DEVICE_FMK=${SRCROOT}/../${FMK_NAME}/Products/$RE_OS/${FMK_NAME}.framework
SIMULATOR_FMK=${SRCROOT}/../${FMK_NAME}/Products/$RE_SIMULATOR/${FMK_NAME}.framework

# -configuration ${CONFIGURATION}

# Clean and Building both architectures.

xcodebuild -configuration "Release"  -sdk iphoneos -arch armv7 -arch arm64 clean build CONFIGURATION_BUILD_DIR="$DEVICE_DIR" OBJROOT="${OBJROOT}/DependentBuilds"

xcodebuild -configuration "Release"  -sdk iphonesimulator -arch x86_64 -arch i386 clean build CONFIGURATION_BUILD_DIR="$SIMULATOR_DIR" OBJROOT="${OBJROOT}/DependentBuilds"

# Cleaning the oldest.

if [ -d "${INSTALL_DIR}" ]

then

rm -rf "${INSTALL_DIR}"

fi

mkdir -p "${INSTALL_DIR}"

echo "DEVICE_DIR = ${DEVICE_DIR}"
echo "SIMULATOR_DIR = ${SIMULATOR_DIR}"

cp -R "${DEVICE_FMK}/"  "${INSTALL_DIR}/"

rm -r "${INSTALL_DIR}/${FMK_NAME}"

# # Uses the Lipo Tool to merge both binary files (i386 + armv6/armv7) into one Universal final product.

lipo -create "${DEVICE_FMK}/${FMK_NAME}" "${SIMULATOR_FMK}/${FMK_NAME}" -output "${INSTALL_DIR}/${FMK_NAME}"

cp -a ${PROJECT_DIR}/../build/universal/include/  ${INSTALL_DIR}/Headers

UNI_INC_DIR=${INSTALL_DIR}/Headers

replace() {
    f=$1
    n=`basename $f`
    cp $f /tmp/$n
    perl -pe 's/#include "(libavcodec|libavformat|libavutil|libswscale|libswresample)\//#include "IJKMediaFramework\/\1\//g' /tmp/$n > $f
    rm /tmp/$n
}

for f in `find $UNI_INC_DIR -iname '*.h'`; do
    echo "replace"
    echo $f
    replace $f
done

cpy_inttypes() {
    file="$(xcode-select -p)/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/clang/include/inttypes.h"
    cp $file $UNI_INC_DIR
    find $UNI_INC_DIR -type f -exec sed -i '' "s/<inttypes.h>/\"IJKMediaFramework\/inttypes.h\"/g" {} \;
}

# avoid xcode can't find <inttypes.h>
# don't delete module.modulemap for swift can't load module
# maybe make ffmpeg to standalone framework is better
# --2019.08.12 jsyan
cpy_inttypes

rm -rf "${DEVICE_DIR}"
rm -rf "${SIMULATOR_DIR}"

# open "${SRCROOT}/../Products/"
