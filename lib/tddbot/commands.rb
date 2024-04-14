require 'tddbot'

module Tddbot
  module Commands
    Registry = CLI::Kit::CommandRegistry.new(default: 'help')

    def self.register(const, cmd, path)
      autoload(const, path)
      Registry.add(->() { const_get(const) }, cmd)
    end

    register :Example, 'example', 'tddbot/commands/example'
    register :Help,    'help',    'tddbot/commands/help'
  end
end
