Pod::Spec.new do |s|
  s.name             = 'ShareSDK3'
  s.version          = "4.0.4"
  s.summary          = 'ShareSDK is the most comprehensive Social SDK in the world,which share easily with 40+ platforms.'
  s.license          = 'MIT'
  s.author           = { "Jinghuang Liu" => "liujinghuang@icloud.com" }

  s.homepage         = 'http://www.mob.com'
  s.source           = { :git => "https://github.com/ShareSDKPlatform/ShareSDK.git", :tag => s.version.to_s }
  s.platform         = :ios
  s.ios.deployment_target = "8.0"
  s.frameworks       = 'JavaScriptCore'
  s.libraries        = 'z.1.2.5', 'stdc++'

  s.default_subspecs    = 'ShareSDK'
  s.vendored_frameworks = 'SDK/ShareSDK/ShareSDK.framework'
  s.dependency 'MOBFoundation'

  # 核心模块
    s.subspec 'ShareSDK' do |sp|
        sp.vendored_frameworks = 'SDK/ShareSDK/Support/Required/ShareSDKConnector.framework'
        sp.resources = 'SDK/ShareSDK/Support/Required/ShareSDK.bundle'
    end

    # 各个平台：需要集成哪些平台需要选择相应的平台语句，如果以下语句没有对应的平台，则是：1、不需要（如Twitter），2、ShareSDK尚未支持。
    s.subspec 'ShareSDKPlatforms' do |sp|

        # QQ
        sp.subspec 'QQ' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformSDK/QQSDK/TencentOpenAPI.framework','SDK/ShareSDK/Support/PlatformConnector/QQConnector.framework'
            ssp.libraries = 'sqlite3'
        end

        # SinaWeibo
        sp.subspec 'SinaWeibo' do |ssp|
            ssp.vendored_libraries = "SDK/ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.a"
            ssp.resources = 'SDK/ShareSDK/Support/PlatformSDK/SinaWeiboSDK/WeiboSDK.bundle'
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/SinaWeiboConnector.framework'
            ssp.frameworks = 'ImageIO'
            ssp.libraries = 'sqlite3'
            ssp.source_files = "SDK/ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.{h,m}"
            ssp.public_header_files = "SDK/ShareSDK/Support/PlatformSDK/SinaWeiboSDK/*.h"
        end

        # WeChat
        sp.subspec 'WeChat' do |ssp|
            ssp.vendored_libraries = "SDK/ShareSDK/Support/PlatformSDK/WeChatSDK/*.a"
            ssp.source_files = "SDK/ShareSDK/Support/PlatformSDK/WeChatSDK/*.{h,m}"
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/WechatConnector.framework'
            ssp.public_header_files = "SDK/ShareSDK/Support/PlatformSDK/WeChatSDK/*.h"
            ssp.libraries = 'sqlite3'
        end

        # RenRen
        sp.subspec 'RenRen' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformSDK/RenRenSDK/RennSDK.framework' ,'SDK/ShareSDK/Support/PlatformConnector/RenrenConnector.framework'
            ssp.resource = 'SDK/ShareSDK/Support/PlatformSDK/RenRenSDK/RennSDK.bundle'
        end

        # 支付宝
        sp.subspec 'AliPaySocial' do |ssp|
            ssp.vendored_libraries = 'SDK/ShareSDK/Support/PlatformSDK/APSocialSDK/*.a'
            ssp.source_files = "SDK/ShareSDK/Support/PlatformSDK/APSocialSDK/*.{h,m}"
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/AliPayConnector.framework'
            ssp.public_header_files = "SDK/ShareSDK/Support/PlatformSDK/APSocialSDK/*.h"
        end

        # Kakao
        sp.subspec 'Kakao' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformSDK/KaKaoSDK/KakaoOpenSDK.framework','SDK/ShareSDK/Support/PlatformConnector/KakaoConnector.framework'
        end

        # MeiPai
        sp.subspec 'MeiPai' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformSDK/MPShareSDK/MPShareSDK.framework','SDK/ShareSDK/Support/PlatformConnector/MeiPaiConnector.framework'
            ssp.frameworks = 'AssetsLibrary'
        end

        # Yixin
        sp.subspec 'Yixin' do |ssp|
            ssp.vendored_libraries = "SDK/ShareSDK/Support/PlatformSDK/YiXinSDK/*.a"
            ssp.source_files = "SDK/ShareSDK/Support/PlatformSDK/YiXinSDK/*.{h,m}"
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/YiXinConnector.framework'
            ssp.public_header_files = "SDK/ShareSDK/Support/PlatformSDK/YiXinSDK/*.h"
        end

        # Facebook
        sp.subspec 'Facebook' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformSDK/FacebookMessengerSDK/FBSDKMessengerShareKit.framework','SDK/ShareSDK/Support/PlatformConnector/FacebookConnector.framework'
        end

        # Copy
        sp.subspec 'Copy' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/CopyConnector.framework'
        end

        # Evernote
        sp.subspec 'Evernote' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/EvernoteConnector.framework'
        end

        # GooglePlus
        sp.subspec 'GooglePlus' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/GooglePlusConnector.framework'
        end

        # Instagram
        sp.subspec 'Instagram' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/InstagramConnector.framework'
            ssp.frameworks = 'AssetsLibrary','Photos'
        end

        # Instapaper
        sp.subspec 'Instapaper' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/InstapaperConnector.framework'
        end

        # Line
        sp.subspec 'Line' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformSDK/LineSDK/LineSDK.framework','SDK/ShareSDK/Support/PlatformConnector/LineConnector.framework'
        end

        # Mail
        sp.subspec 'Mail' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/MailConnector.framework'
        end

        # SMS
        sp.subspec 'SMS' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/SMSConnector.framework'
        end

        # WhatsApp
        sp.subspec 'WhatsApp' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/WhatsAppConnector.framework'
        end

        # YouTube
        sp.subspec 'YouTube' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/YouTubeConnector.framework'
        end

        # Twitter
        sp.subspec 'Twitter' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/TwitterConnector.framework'
        end

        # Dropbox
        sp.subspec 'Dropbox' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformConnector/DropboxConnector.framework'
        end

        # DingTalk
        sp.subspec 'DingTalk' do |ssp|
            ssp.vendored_frameworks = 'SDK/ShareSDK/Support/PlatformSDK/DingTalkSDK/DTShareKit.framework','SDK/ShareSDK/Support/PlatformConnector/DingTalkConnector.framework'
        end
    end

    # ShareSDK 配置文件模块
    s.subspec 'ShareSDKConfigurationFile' do |sp|
        sp.vendored_frameworks = 'SDK/ShareSDK/Support/Optional/ShareSDKConfigFile.framework'
    end
    
    # ShareSDK Extension扩展模块
    s.subspec 'ShareSDKExtension' do |sp|
        sp.vendored_frameworks = 'SDK/ShareSDK/Support/Optional/ShareSDKExtension.framework'
    end

    # ShareSDK提供的UI
    s.subspec 'ShareSDKUI' do |sp|
        sp.vendored_frameworks = 'SDK/ShareSDK/Support/Optional/ShareSDKUI.framework'
        sp.resources = 'SDK/ShareSDK/Support/Optional/ShareSDKUI.bundle'
    end
end
