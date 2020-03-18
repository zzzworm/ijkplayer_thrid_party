BUILD_PATH="IJKMediaPlayer/Build/Products"
REAL_PATH="$BUILD_PATH/Release-iphoneos/IJKMediaFramework.framework/IJKMediaFramework"
SIMU_PATH="$BUILD_PATH/Release-iphonesimulator/IJKMediaFramework.framework/IJKMediaFramework"
OUTPUT_PATH="IJKMediaPlayer/Build/Products/Release-iphoneos/IJKMediaFramework.framework"
LIPO_PATH="output/IJKMediaFramework"
VERSION="0.2.2"
LIB_NAME=IJKMediaFramework.tar.xz

case "$1" in

"lipo")
    echo "exec: $0 lipo"
    rm -rf output
    mkdir output
    cp -R "IJKMediaPlayer/Build/Products/Release-iphoneos/IJKMediaFramework.framework" output
    cp pod/LICENSE output
    lipo -create $REAL_PATH $SIMU_PATH -o $LIPO_PATH
    cp $LIPO_PATH "output/IJKMediaFramework.framework/IJKMediaFramework"
    rm $LIPO_PATH
    ;;
"tar")

    cd output
    tar -cvJf $LIB_NAME IJKMediaFramework.framework LICENSE
    open -R IJKMediaFramework.framework
    cd ..
    ;;
"split")
    echo "exec: $0 split"
    cd output
    # split file
    split -b 10m $LIB_NAME "$LIB_NAME".

    ls "$LIB_NAME".* >files
    cd ..
    ;;
"cat")
    echo "exec: $0 cat"
    cd output
    CAT_SHELL=""

    for DL_FILE in $(ls $LIB_NAME.*); do

        CAT_SHELL="$CAT_SHELL wget https://cdn.jsdelivr.net/gh/CaiJingLong/flutter_ijkplayer_pod_spliter@${VERSION}/$DL_FILE\n"

    done

    CAT_SHELL="$CAT_SHELL cat IJKMediaFramework.tar.xz.* > IJKMediaFramework.tar.xz\n"
    CAT_SHELL="$CAT_SHELL tar xvf IJKMediaFramework.tar.xz\n"
    CAT_SHELL="$CAT_SHELL rm IJKMediaFramework.tar.xz.* IJKMediaFramework.tar.xz\n"

    echo "$CAT_SHELL" | tee cat.sh
    chmod 777 cat.sh

    cp ../pod/README.md .
    tar -cvzf README.tar.gz README.md LICENSE cat.sh
    cd ..
    ;;
"upload")
    VERSION=$VERSION python3 pod/upload.py
    ;;
"all")
    $0 lipo
    $0 tar
    $0 split
    $0 cat
    ;;
*)
    echo "$0 lipo|tar|split|cat|all|upload"
    ;;

esac
