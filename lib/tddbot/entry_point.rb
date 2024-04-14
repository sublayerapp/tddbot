require 'tddbot'

module Tddbot
  module EntryPoint
    def self.call(args)
      cmd, command_name, args = Tddbot::Resolver.call(args)
      Tddbot::Executor.call(cmd, command_name, args)
    end
  end
end
