Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_s3_download'
  s.version     = '1.0.4'
  s.summary     = 'Spree extension to allow s3 downloads in products - great for digital downloads e commerce'
  s.description = 'A Spree extension to allow s3 downloads in products'
  s.homepage    = 'http://github.com/remkade/spree-s3-download'
  s.required_ruby_version = '>= 1.8.7'
  s.author            = 'Jack Kinsella'
  s.email             = 'jack.kinsella@gmail.com'
  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*', 'config/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('spree_core', '>= 0.70.0')
  s.add_dependency('aws-s3')
end