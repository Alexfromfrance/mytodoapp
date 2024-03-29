# -*- encoding: utf-8 -*-
# stub: postmark-rails 0.19.0 ruby lib

Gem::Specification.new do |s|
  s.name = "postmark-rails".freeze
  s.version = "0.19.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "source_code_uri" => "https://github.com/wildbit/postmark-rails" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Petyo Ivanov".freeze, "Ilya Sabanin".freeze, "Artem Chistyakov".freeze]
  s.date = "2019-01-11"
  s.description = "The Postmark Rails Gem is a drop-in plug-in for ActionMailer to send emails via Postmark, an email delivery service for web apps.".freeze
  s.email = "tema@wildbit.com".freeze
  s.extra_rdoc_files = ["LICENSE".freeze, "README.md".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze]
  s.homepage = "http://postmarkapp.com".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Postmark adapter for ActionMailer".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionmailer>.freeze, [">= 3.0.0"])
      s.add_runtime_dependency(%q<postmark>.freeze, ["~> 1.15.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<actionmailer>.freeze, [">= 3.0.0"])
      s.add_dependency(%q<postmark>.freeze, ["~> 1.15.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<actionmailer>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<postmark>.freeze, ["~> 1.15.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
