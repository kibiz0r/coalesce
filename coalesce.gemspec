# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = 'coalesce'
  gem.description   = "Adds a nil-coalescing method to Ruby, similar to C#'s ?? null-coalescing operator"
  gem.homepage      = "https://github.com/kibiz0r/#{gem.name}"
  gem.version       = '0.0.1'

  gem.authors       = ['Michael Harrington']
  gem.email         = ['kibiz0r@gmail.com']

  gem.files         = `git ls-files`.split($\)
  gem.require_paths = ['lib']

  gem.summary       = <<-END.gsub(/^ +/, '')
    foo || bar is a nice idiom for returning bar if foo is nil. Unfortunately, it also returns bar if foo is false.
    foo._? bar is a clean alternative that respects false values.
    foo._? { bar } allows you to keep the short-circuiting behavior of the || operator.
  END
end
