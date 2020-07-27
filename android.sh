export ANDROID_SDK=$ANDROID_HOME
export ANDROID_NDK=/Users/jinglongcai/sdk/ndk/android-ndk-r10e

./init-config.sh # 初始化配置
./init-android.sh # 初始安卓,这里可能会下载ffmpeg,耐心等待
./init-android-openssl.sh  # 初始android的openssl, 如果你不需要https协议,可以跳过这一步