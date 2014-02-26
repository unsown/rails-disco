require 'drails/generators'

if [nil, '-h', '--help'].include?(ARGV.first)
  Rails::Generators.help 'generate'
  exit
end

name = ARGV.shift
name = name.sub(/^drails:/, '')

root = defined?(ENGINE_ROOT) ? ENGINE_ROOT : Rails.root
Rails::Generators.invoke "drails:#{name}", ARGV, behavior: :invoke, destination_root: root
