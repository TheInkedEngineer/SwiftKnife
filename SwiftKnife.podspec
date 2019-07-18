Pod::Spec.new do |s|
  s.name             = 'SwiftKnife'
  s.version          = File.read(".version")
  s.summary          = 'A collection of Swift helpers and UI elements to make coding faster and more efficient.'
  s.homepage         = 'http://theinkedengineer.com'
  s.license          = { :type => 'Apache License 2.0' }
  s.author           = { 'Firas Safa' => 'firas@theinkedengineer.com' }
  s.source           = { :git => 'https://github.com/TheInkedEngineer/SwiftKnife.git', :tag => s.version.to_s }

  s.swift_version    = '5.0'

  s.ios.deployment_target = '10.0'
  
  s.ios.source_files = [
    'SwiftKnife/Helpers/**/*.swift',
    'SwiftKnife/UI/**/*.swift',
    'SwiftKnife/Resources/SwiftKnife.h',
  ]

end
