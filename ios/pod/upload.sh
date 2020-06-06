export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;
pod trunk push FlutterIJK.podspec --verbose --allow-warnings 2>&1 | tee /tmp/trunk.log 