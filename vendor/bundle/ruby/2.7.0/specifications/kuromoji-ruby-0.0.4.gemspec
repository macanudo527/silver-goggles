# -*- encoding: utf-8 -*-
# stub: kuromoji-ruby 0.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "kuromoji-ruby".freeze
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["toyama0919".freeze]
  s.date = "2016-11-28"
  s.description = "kuromoji provides ruby API for Kuromoji(http://www.atilika.org/) Japanese morphological analyzer using rjb.".freeze
  s.email = ["toyama0919@gmail.com".freeze]
  s.executables = ["kuromoji".freeze]
  s.files = ["bin/kuromoji".freeze]
  s.homepage = "https://github.com/toyama0919/kuromoji-ruby".freeze
  s.licenses = ["Apache License, Version 2.0".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "A ruby wrapper for the Kuromoji Japanese morphological analyzer.".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rjb>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.5"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<thor>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<yajl-ruby>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rjb>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.5"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<thor>.freeze, [">= 0"])
    s.add_dependency(%q<yajl-ruby>.freeze, [">= 0"])
  end
end
