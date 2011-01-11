Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_s3_download'
  s.version     = '1.0.2'
  s.summary     = 'Spree extension to allow s3 downloads in products - great for digital downloads e commerce'
  s.required_ruby_version = '>= 1.8.7'
  s.author            = 'Jack Kinsella'
  s.email             = 'jack.kinsella@gmail.com'
  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('spree_core', '>= 0.40.0')
  #using this fork of right_aws to avoid a Rails 3 error
  s.add_dependency("mikel-right_aws --source=https://github.com/mikel/right_aws.git")
end                                               