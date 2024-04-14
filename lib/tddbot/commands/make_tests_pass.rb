require 'tddbot'

module Tddbot
  module Commands
    class MakeTestsPass < Tddbot::Command
      def call(_args, _name)
        Sublayer::Tasks::MakeRspecTestsPass.new(implementation_file_path: _args[0], test_command: _args[1]).run
      end

      def self.help
        "Have an LLM continually modify the implementation file until the test command passes successfully.\n
        Usage: {{command:#{Tddbot::TOOL_NAME} make_tests_pass <implementation_file_path> \"<test_command>\"}}\n
        Example: {{command:#{Tddbot::TOOL_NAME} make_tests_pass lib/my_class.rb \"rspec spec/my_class_spec.rb\"}}"
      end
    end
  end
end
