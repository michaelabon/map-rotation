lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'map_rotation/version'

Gem::Specification.new do |s|
	s.name = 'map-rotation'
	s.version = Version::VERSION
  s.authors = ["Mike Kenyon"]
  s.email = ["mike.kenyon@gmail.com"]
  s.homepage = "http://github.com/mkenyon/map-rotation"
	s.summary = "Builds a new map rotation file for hl2-based games"

	s.files = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)
  s.require_path = 'lib'
  s.executables = Dir.glob("bin/*").map(&File.method(:basename))
end
