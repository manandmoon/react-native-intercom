Pod::Spec.new do |s|
  s.name         = "react-native-intercom"
  s.version      = "0.0.4"
  s.source_files  = "iOS/*.{h,m}"
  s.dependency 'React'
  s.dependency 'Intercom'
  s.platform = :ios, "8.0"
end
