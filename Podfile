# Uncomment this line to define a global platform for your project
# platform :ios, '8.0'
# Uncomment this line if you're using Swift
use_frameworks!

target 'Coffee' do
pod 'BTNavigationDropdownMenu', :git => 'https://github.com/PhamBaTho/BTNavigationDropdownMenu.git', :branch => 'swift-3.0'
pod 'Hue'
pod 'NVActivityIndicatorView'
pod 'Alamofire'
pod 'AlamofireImage'
pod 'SwiftyJSON'
pod 'RxSwift'
pod 'RxCocoa'
pod 'RxAlamofire'
pod 'RealmSwift'
pod 'R.swift'
pod 'RealmGeoQueries'
pod 'RxRealm'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
            config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.10'
        end
    end
end
