Pod::Spec.new do |s|

  s.name         = "StringUtilities"
  s.version      = "1.0.0"
  s.summary      = "A collection of utilities to work with strings"

  s.description  = <<-DESC
  Collection of utilities to work with strings, including regex helpers and
  trimming methods
                   DESC

  s.homepage     = "http://visualnacert.com"
  s.license      = { :type => "Propietary", :file => "LICENSE" }
  s.author       = { "Lluís Ulzurrun de Asanza i Sàez" => "lulzurrun@visualnacert.com" }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"

  s.source       = {
  	:git => "git@bitbucket.org:vnac/stringutilities.git",
  	:tag => "#{s.version}"
  }

  s.source_files  = "Source", "Source/**/*.{h,m,swift}"

end
