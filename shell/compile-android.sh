echo 'will compile openssl ffmpeg and ijkplayer'


echo 'compile openssl'

cd android/contrib

./compile-openssl.sh clean
./compile-ffmpeg.sh clean

./compile-openssl.sh armv7a
./compile-openssl.sh arm64
./compile-openssl.sh x86
./compile-openssl.sh x86_64

echo 'compile ffmpeg'
./compile-ffmpeg.sh armv7a
./compile-ffmpeg.sh arm64
./compile-ffmpeg.sh x86
./compile-ffmpeg.sh x86_64

cd ..

echo 'compile ijkplayer'

./compile-ijk.sh armv7a
./compile-ijk.sh arm64
./compile-ijk.sh x86
./compile-ijk.sh x86_64
