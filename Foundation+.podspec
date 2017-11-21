#
#  Be sure to run `pod spec lint Foundation+.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "Foundation+"
  s.version      = "0.1.0"
  s.summary      = "A collection extension for Foundation entity."

  s.description  = <<-DESC
                    it's a collection extension of the Foundation entity, you can use it in you project
                   DESC

  s.homepage     = "https://github.com/CNKCQ/Foundation.plus.git"
  s.screenshots  = "http://7xslr9.com1.z0.glb.clouddn.com/IDCardKeyboard.gif"

  s.license      = { :type => "Apache", :file => "LICENSE" }

  s.author             = { "CNKCQ" => "wangchengqvan@gmail.com" }
  # Or just: s.author    = "KingCQ"
  # s.authors            = { "KingCQ" => "wangchengqvan@gmail.com" }
  # s.social_media_url   = "http://twitter.com/KingCQ"


  # s.platform     = :ios
  # s.platform     = :ios, "9.0"

  #  When using multiple platforms
  s.ios.deployment_target = '9.0'

  s.source       = { :git => "https://github.com/CNKCQ/Foundation.plus.git", :tag => "#{s.version}" }


    if ENV['lib'] || ENV['LibTest']
        s.vendored_frameworks = "Foundation_.framework"
    #else
        s.source_files  = "Foundation+", "Foundation+/**/*.{h,m,swift}"
    end
    s.source_files  = "Foundation+", "Foundation+/**/*.{h}"
  s.exclude_files = "Foundation+/Exclude"

  # s.public_header_files = "Classes/**/*.h"



  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"
  s.resource_bundles = {
}



  # ―
  s.framework  = "Foundation"


end
