#
# Be sure to run `pod lib lint MSInteractBubbleTransition.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MSInteractBubbleTransition'
  s.version          = '0.1.0'
  s.summary          = 'MSInteractBubbleTransition provides an interactive transition manager to dismiss view controller with a bubble effects.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
MSInteractBubbleTransition provides an interactive transition manager to dismiss view controller with a bubble effects.
Interactive view transition to dismiss view with bubble effects in Swift
                       DESC

  s.homepage         = 'https://github.com/Mars-Shen/MSInteractBubbleTransition'
  s.screenshots      = 'https://raw.githubusercontent.com/Mars-Shen/MSInteractBubbleTransition/master/ScreenShot/Demo1.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mars Shen' => 'look1239@gmail.com' }
  s.source           = { :git => 'https://github.com/Mars-Shen/MSInteractBubbleTransition.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MSInteractBubbleTransition/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MSInteractBubbleTransition' => ['MSInteractBubbleTransition/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
