$:.push File.expand_path('../lib', __FILE__)
require 'chock/version'

Gem::Specification.new do |s|
  s.name        = 'chock'
  s.version     = Chock::VERSION
  s.authors     = ['Matthew Hassfurder']
  s.email       = ['sephonicus@gmail.com']
  s.homepage    = ''
  s.summary     = %q{Generate interesting example text.}
  s.description = %q{Chock is a small library used for outputting interesting example text and markup structures.}

  s.rubyforge_project = 'chock'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
