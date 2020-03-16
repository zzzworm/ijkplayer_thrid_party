Pod::Spec.new do |spec|

  version = "0.2.0"
  spec.name         = "FlutterIJK"
  spec.version      = "#{version}"
  spec.summary      = "IJKPlayer for Flutter."
  spec.description  = <<-DESC
  IJKPlayer for flutter
                   DESC
  
  spec.homepage     = "https://github.com/CaiJingLong/flutter_ijkplayer_pod"
  spec.license      = { :type => 'MIT', :file =>'LICENSE' }
  spec.author             = { "Caijinglong" => "cjl_spy@163.com" }
  spec.source       = { :http => "https://dl.bintray.com/caijinglong/cocoapod/#{version}/IJKMediaFramework.tar.xz"}
  spec.vendored_frameworks = 'IJKMediaFramework.framework'
  spec.frameworks  = "AudioToolbox", "AVFoundation", "CoreGraphics", "CoreMedia", "CoreVideo", "MobileCoreServices", "OpenGLES", "QuartzCore", "VideoToolbox", "Foundation", "UIKit", "MediaPlayer"
  spec.libraries   = "bz2", "z", "stdc++"

  spec.platform = :ios
  spec.ios.deployment_target = '8.0'
  spec.requires_arc = true

#   spec.prepare_command = <<-CMD
#     FILES=$(ls)
#     OUTPUT="IJKMediaFramework.framework"
#     mkdir $OUTPUT
#     for FILE in $FILES; do
#         if [ "$FILE" != 'cp.sh' ];then
#             echo $FILE
#             mv $FILE $OUTPUT
#         fi
#     done
#   CMD
end