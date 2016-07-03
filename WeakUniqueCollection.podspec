#
# Be sure to run `pod lib lint WeakUniqueCollection.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WeakUniqueCollection'
  s.version          = '0.1.0'
  s.summary          = 'Objective-C collection class that stores weak references to the objects and maintains uniqueness and thread safety.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'WeakUniqueCollection class has behavior similar to NSMutableSet (in terms of uniqueness of objects inside it)' \
                       'but it stores weak references and thread-safe. It could be very useful for implementation of'\
                       'multi-cast delegates and observers.'

  s.homepage         = 'https://github.com/sibext/WeakUniqueCollection'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Artyom Gladkov' => 'gladkov@sibext.com' }
  s.source           = { :git => 'https://github.com/sibext/WeakUniqueCollection.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Classes/**/*'
  
end
