require 'erb'

name = 'Cassi'
message = 'Hello, <%= name %>.'
erb = ERB.new(message)

puts erb.result # => 'Hello, Dan.'
