Pod::Spec.new do |s|

  s.name         = "StringUtilities"
  s.version      = "2.2.0"
  s.summary      = "A collection of utilities to work with strings"

  s.description  = <<-DESC
  Collection of utilities to work with strings, including regex helpers and
  trimming methods
  DESC

  s.homepage     = "https://github.com/visualNACert/StringUtilities"

  s.license      = { :type => "LGPL2", :file => "LICENSE" }

  s.author       = {
    "Lluís Ulzurrun de Asanza i Sàez" => "lulzurrun@visualnacert.com"
  }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"

  s.source       = {
  	:git => "https://github.com/visualNACert/StringUtilities.git",
  	:tag => "#{s.version}"
  }

  s.source_files  = "Source", "Source/**/*.{h,m,swift}"
  s.exclude_files = "Source/Exclude"

end
