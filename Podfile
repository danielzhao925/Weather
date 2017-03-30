source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target 'Weather-Swift' do
    pod 'SVProgressHUD'
    pod 'Alamofire', '~> 4.0'
    pod 'ObjectMapper', '~> 2.2'
end

target 'Weather-SwiftTests' do
    pod 'Nimble'
    pod 'ObjectMapper', '~> 2.2'
    pod 'Alamofire', '~> 4.0'
end


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
