
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
#require "stock/cli/app/version"

Gem::Specification.new do |spec|
  spec.name          = "stock-cli-app"
  spec.version       = 1.2 #Stock::Cli::App::VERSION
  spec.authors       = ["'Anu Khambete'"]
  spec.email         = ["'anukhambete@gmail.com'"]

  spec.summary       = %q{ Stock screener CLI application.}
  spec.description   = %q{ Refer to README.md.}
  #spec.homepage      = " Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata["allowed_push_host"] = " Set to 'http://mygemserver.com'"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against " \
  #    "public gem pushes."
  #end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  #spec.bindir        = "exe"
  spec.executables   = ["stock-info"]
  #spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
