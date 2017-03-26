Pod::Spec.new do |s|
  s.name         = "SIScreenBrightnessObserver"
  s.version      = "0.1.0"
  s.summary      = "A ScreenBrightnessObserver."
  s.description  = <<-DESC
  						A ScreenBrightness Observer
                   DESC

  s.homepage     = "https://github.com/silence0201/ScreenBrightnessObserver"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Silence" => "374619540@qq.com" }
  s.social_media_url   = "https://twitter.com/Silencee0201"

  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/silence0201/ScreenBrightnessObserver.git", :tag => "0.1.0" }
  s.source_files  = "ScreenBrightnessObserver", "ScreenBrightnessObserver/**/*.{h,m}"
  s.exclude_files = "ScreenBrightnessObserver/Exclude"

  s.public_header_files = "ScreenBrightnessObserver/**/*.h"
  s.requires_arc = true

end
