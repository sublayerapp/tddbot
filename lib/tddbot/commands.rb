require 'tddbot'

module Tddbot
  module Commands
    Registry = CLI::Kit::CommandRegistry.new(default: 'help')

    def self.register(const, cmd, path)
      autoload(const, path)
      Registry.add(->() { const_get(const) }, cmd)
    end

    register :MakeTestsPass, 'make_tests_pass', 'tddbot/commands/make_tests_pass'
    register :Help,    'help',    'tddbot/commands/help'
  end
end
