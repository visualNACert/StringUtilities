#
#  Be sure to run `pod spec lint VisualAPI.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "StringUtilities"
  s.version      = "0.0.3"
  s.summary      = "A collection of utilities to work with strings"

  s.description  = <<-DESC
  Collection of utilities to work with strings, including regex helpers and
  trimming methods
                   DESC

  s.homepage     = "http://visualnacert.com"

  s.license      = { :type => "Propietary", :file => "LICENSE" }

  s.author             = { "Lluís Ulzurrun de Asanza i Sàez" => "lulzurrun@visualnacert.com" }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"

  s.source       = {
  	:git => "/Volumes/Soluciones Tecnológicas/Backups/iOS v2/iOS Libs/StringUtilities",
  	:tag => "#{s.version}"
  }

  s.source_files  = "Source", "Source/**/*.{h,m,swift}"
  s.exclude_files = "Source/Exclude"

  # s.public_header_files = "Classes/**/*.h"

end
