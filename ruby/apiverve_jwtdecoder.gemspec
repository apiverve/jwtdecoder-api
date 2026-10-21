# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_jwtdecoder"
  spec.version       = "1.2.2"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "JWT Decoder API - Ruby Client"
  spec.description   = "JWT Decoder decodes JWT tokens to reveal header and payload information without performing signature verification. It handles JSON web token decode from any language over REST, so you can inspect claims and expiry without adding a JWT library."
  spec.homepage      = "https://apiverve.com/marketplace/jwtdecoder?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/jwtdecoder-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/jwtdecoder"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
