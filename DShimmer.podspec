Pod::Spec.new do |s|
    s.name             = 'DShimmer'
    s.version          = '1.0'
    s.summary          = 'DShimmer is a lightweight and customizable shimmer loading view for iOS — built with UIView and SwiftUI support.'
    s.homepage         = 'https://github.com/dioputrautama/DShimmer'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Dio Putra' => 'dioputrautama.com' }
    s.source           = { :git => 'https://github.com/dioputrautama/DShimmer.git', :tag => s.version.to_s }
    s.ios.deployment_target = '13.0'
    s.osx.deployment_target = '10.15'
    s.watchos.deployment_target = '6.0'
    s.tvos.deployment_target = '13.0'
    s.swift_version = '5.0'
    s.source_files = 'Sources/DShimmer/**/*'
end
