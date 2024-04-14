require 'cli/ui'
require 'cli/kit'

CLI::UI::StdoutRouter.enable

module Tddbot
  TOOL_NAME = 'tddbot'
  ROOT      = File.expand_path('../..', __FILE__)
  LOG_FILE  = '/tmp/tddbot.log'

  autoload(:EntryPoint, 'tddbot/entry_point')
  autoload(:Commands,   'tddbot/commands')

  Config = CLI::Kit::Config.new(tool_name: TOOL_NAME)
  Command = CLI::Kit::BaseCommand

  Executor = CLI::Kit::Executor.new(log_file: LOG_FILE)
  Resolver = CLI::Kit::Resolver.new(
    tool_name: TOOL_NAME,
    command_registry: Tddbot::Commands::Registry
  )

  ErrorHandler = CLI::Kit::ErrorHandler.new(log_file: LOG_FILE)
end
