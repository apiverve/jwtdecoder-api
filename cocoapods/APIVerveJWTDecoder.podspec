Pod::Spec.new do |s|
  s.name             = 'APIVerveJWTDecoder'
  s.version          = '1.2.3'
  s.summary          = 'JWT Decoder decodes JWT tokens to reveal header and payload information without performing signature verification.'
  s.description      = <<-'DESC'
JWT Decoder decodes JWT tokens to reveal header and payload information without performing signature verification. It handles JSON web token decode from any language over REST, so you can inspect claims and expiry without adding a JWT library.

This iOS/macOS SDK provides a convenient way to access the JWT Decoder from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/jwtdecoder?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/jwtdecoder-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveJWTDecoder/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
