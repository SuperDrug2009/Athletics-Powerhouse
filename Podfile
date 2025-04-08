source 'https://cdn.cocoapods.org/'
 
platform :ios, '12.0'
 
target 'UnityFramework' do
  pod 'AppsFlyerFramework', '6.13.0'
  pod 'Firebase/Core', '10.5.0'
  pod 'Firebase/Messaging', '10.5.0'
end

target 'Unity-iPhone' do
end

target 'helpfulness' do
    pod 'GoogleUtilities/AppDelegateSwizzler'
    pod 'GoogleUtilities/MethodSwizzler'
    pod 'GoogleUtilities/Network'
    pod 'GoogleUtilities/NSData+zlib'
    pod 'GoogleUtilities/AppDelegateSwizzler'
    pod 'GoogleUtilities/Environment'
    pod 'GoogleUtilities/Logger'
    pod 'GoogleUtilities/UserDefaults'
    pod 'GoogleUtilities/Reachability'
    pod 'Firebase/Messaging', '10.5.0'
end

use_frameworks! :linkage => :static

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      # Добавляем настройки для Swift
      config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
      config.build_settings['SWIFT_VERSION'] = '5.0'
    end
  end
end
