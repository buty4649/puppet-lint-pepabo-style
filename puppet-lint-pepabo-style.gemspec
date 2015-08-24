Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-pepabo-style'
  spec.version     = '0.0.1'
  spec.homepage    = 'https://github.com/buty4649/puppet-lint-pepabo-style'
  spec.license     = 'MIT'
  spec.author      = 'buty4649'
  spec.email       = 'buty4649@gmail.com'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.test_files  = Dir['spec/**/*']
  spec.summary     = 'A puppet-lint plugin to check pepabo coding style.'
  spec.description = <<-EOF
     A puppet-lint plugin to check pepabo coding style.
     see. http://pepabo.github.io/docs/puppet/style-guide.html
  EOF
  spec.add_dependency             'puppet-lint', '~> 1.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its', '~> 1.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
  spec.add_development_dependency 'rake'
end
