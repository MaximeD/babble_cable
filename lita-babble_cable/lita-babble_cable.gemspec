Gem::Specification.new do |spec|
  spec.name          = "lita-babble_cable"
  spec.version       = "0.1.0"
  spec.authors       = ["unplugandplay"]
  spec.email         = ["unplugandplay@free.fr"]

  spec.description   = %q{Lita adapter for Babble Cable.}
  spec.summary       = %q{Lita adapter for SlBabble Cableack.}
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "adapter" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.7"
  spec.add_runtime_dependency "faye-websocket", ">= 0.8.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
