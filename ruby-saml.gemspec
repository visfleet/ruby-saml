$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'onelogin/ruby-saml/version'

Gem::Specification.new do |s|
  s.name = 'ruby-saml'
  s.version = OneLogin::RubySaml::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["OneLogin LLC"]
  s.date = Time.now.strftime("%Y-%m-%d")
  s.description = %q{SAML toolkit for Ruby on Rails}
  s.email = %q{support@onelogin.com}
  s.license = 'MIT'
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.homepage = %q{https://github.com/onelogin/ruby-saml}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.required_ruby_version = '>= 1.8.7'
  s.summary = %q{SAML Ruby Tookit}

  # Overriding nokogiri's ruby version restrictions. For some reason, they
  # didn't work for me, so sticking us to ruby 2.2 restrictions, which is the
  # version we're currently using until they (ruby-saml devs) fix the issue.
  # Also check https://github.com/onelogin/ruby-saml/issues/623 for more info on this.
  s.add_runtime_dependency('nokogiri', '>= 1.9.1', '< 1.10.0')

  s.add_development_dependency('coveralls')
  s.add_development_dependency('minitest', '~> 5.5')
  s.add_development_dependency('mocha',    '~> 0.14')
  s.add_development_dependency('rake',     '~> 10')
  s.add_development_dependency('shoulda',  '~> 2.11')
  s.add_development_dependency('simplecov')
  s.add_development_dependency('systemu',  '~> 2')
  s.add_development_dependency('timecop',  '<= 0.6.0')

  if defined?(JRUBY_VERSION)
    # All recent versions of JRuby play well with pry
    s.add_development_dependency('pry')
  elsif RUBY_VERSION < '1.9'
    # 1.8.7
    s.add_development_dependency('ruby-debug', '~> 0.10.4')
  elsif RUBY_VERSION < '2.0'
    # 1.9.x
    s.add_development_dependency('debugger-linecache', '~> 1.2.0')
    s.add_development_dependency('debugger', '~> 1.6.4')
  elsif RUBY_VERSION < '2.1'
    # 2.0.x
    s.add_development_dependency('byebug', '~> 2.1.1')
  else
    # 2.1.x, 2.2.x
    s.add_development_dependency('pry-byebug')
  end
end
