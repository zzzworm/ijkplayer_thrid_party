ssl() {
    rm ssl.log
    # ./compile-openssl.sh arm64 2>&1 | tee -a ./ssl.log
    # ./compile-openssl.sh x86_64 2>&1 | tee -a ./ssl.log
    # ./compile-openssl.sh i386 2>&1 | tee -a ./ssl.log
    ./compile-openssl.sh all 2>&1 | tee -a ./ssl.log
    ./compile-openssl.sh lipo 2>&1 | tee -a ./ssl.log
}

ffmpeg() {
    rm ffmpeg.log
    ./compile-ffmpeg.sh arm64 2>&1 | tee -a ./ffmpeg.log
    ./compile-ffmpeg.sh x86_64 2>&1 | tee -a ./ffmpeg.log
    ./compile-ffmpeg.sh i386 2>&1 | tee -a ./ffmpeg.log
    ./compile-ffmpeg.sh lipo 2>&1 | tee -a ./ffmpeg.log
}

clean_openssl() {
    ./compile-openssl.sh clean 2>&1 | tee -a ./clean.log
}

clean_ffmpeg(){
    ./compile-ffmpeg.sh clean 2>&1 | tee -a ./clean.log
}

TARGET=$1
MODULE=$2

if [ "$TARGET" == "ffmpeg" ]; then
    ffmpeg
elif [ "$TARGET" == 'ssl' ]; then
    ssl
elif [ "$TARGET" == 'clean' ]; then
    rm ./clean.log
    if [ "$MODULE" == 'ssl' ]; then
        clean_openssl
    elif [ "$MODULE" == 'ffmpeg' ]; then
        clean_ffmpeg
    elif [ "$MODULE" == 'all' ]; then
        clean_openssl
        clean_ffmpeg
    else
        echo "No clean anything, use $0 clean ffmpeg|ssl|all" 2>&1 | tee -a ./clean.log
    fi
else
    ssl
    ffmpeg
fi
