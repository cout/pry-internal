spec = Gem::Specification.new do |s|
  s.name = 'pry-disasm'
  s.version = '0.0.1'
  s.summary = 'Pry plugin that displays YARV bytecode for a method'
  s.homepage = 'http://github.com/cout/pry-internal/'
  s.author = 'Paul Brannan'
  s.email = 'curlypaul924@gmail.com'
  s.add_dependency 'ruby-internal'
  s.description = <<-END
Pry-disasm is a pry plugin that displays YARV bytecode for a method in a
nice colorized format.
END
  s.files = 'lib/pry-disasm.rb'
end

