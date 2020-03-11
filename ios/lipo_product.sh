BUILD_PATH="IJKMediaPlayer/Build/Products"
REAL_PATH="$BUILD_PATH/Release-iphoneos/IJKMediaFramework.framework/IJKMediaFramework"
SIMU_PATH="$BUILD_PATH/Release-iphonesimulator/IJKMediaFramework.framework/IJKMediaFramework"
OUTPUT_PATH="IJKMediaPlayer/Build/Products/Release-iphoneos/IJKMediaFramework.framework"
LIPO_PATH="output/IJKMediaFramework"

rm -rf output
mkdir output
cp -R "IJKMediaPlayer/Build/Products/Release-iphoneos/IJKMediaFramework.framework" output
lipo -create $REAL_PATH $SIMU_PATH -o $LIPO_PATH
cp $LIPO_PATH "output/IJKMediaFramework.framework/IJKMediaFramework"
rm $LIPO_PATH

open -R output/IJKMediaFramework.framework