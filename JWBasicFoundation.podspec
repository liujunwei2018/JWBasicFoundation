#
# Be sure to run `pod lib lint JWBasicFoundation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JWBasicFoundation'
  s.version          = '0.1.3'
  s.summary          = 'A short description of JWBasicFoundation.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/liujunwei2018/JWBasicFoundation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liujunwei' => 'liujunwei0422@icloud.com' }
  s.source           = { :git => 'https://github.com/liujunwei2018/JWBasicFoundation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.subspec 'NSArray' do |nSArray|
    nSArray.source_files = 'JWBasicFoundation/Classes/NSArray/*.{h,m}'
    nSArray.public_header_files = 'JWBasicFoundation/Classes/NSArray/*.h'
      nSArray.subspec 'NSMutableArray' do |nSMutableArray|
         nSMutableArray.source_files = 'JWBasicFoundation/Classes/NSArray/NSMutableArray/*.{h,m}'
         nSMutableArray.public_header_files = 'JWBasicFoundation/Classes/NSArray/NSMutableArray/*.h'
      end
  end
  s.subspec 'NSDictionary' do |nSDictionary|
    nSDictionary.source_files = 'JWBasicFoundation/Classes/NSDictionary/**/*.{h,m}'
    nSDictionary.public_header_files = 'JWBasicFoundation/Classes/NSDictionary/**/*.h'
  end
  s.subspec 'NSData' do |nSData|
    nSData.source_files = 'JWBasicFoundation/Classes/NSData/**/*.{h,m}'
    nSData.public_header_files = 'JWBasicFoundation/Classes/NSData/**/*.h'
  end
  s.subspec 'NSDate' do |nSDate|
    nSDate.source_files = 'JWBasicFoundation/Classes/NSDate/**/*.{h,m}'
    nSDate.public_header_files = 'JWBasicFoundation/Classes/NSDate/**/*.h'
  end
  s.subspec 'NSNotificationCenter' do |nSNotificationCenter|
    nSNotificationCenter.source_files = 'JWBasicFoundation/Classes/NSNotificationCenter/**/*.{h,m}'
    nSNotificationCenter.public_header_files = 'JWBasicFoundation/Classes/NSNotificationCenter/**/*.h'
  end
  s.subspec 'NSString' do |nSString|
    nSString.source_files = 'JWBasicFoundation/Classes/NSString/**/*.{h,m}'
    nSString.public_header_files = 'JWBasicFoundation/Classes/NSString/**/*.h'
  end
  s.subspec 'NSTimer' do |ss|
    ss.source_files = 'JWBasicFoundation/Classes/NSTimer/**/*.{h,m}'
    ss.public_header_files = 'JWBasicFoundation/Classes/NSTimer/**/*.h'
  end

  s.public_header_files = 'JWBasicFoundation/Classes/JWBasicFoundation.h'
  s.source_files = 'JWBasicFoundation/Classes/JWBasicFoundation.h'
end
