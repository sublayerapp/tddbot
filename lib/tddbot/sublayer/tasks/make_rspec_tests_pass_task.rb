module Sublayer
  module Tasks
    class MakeRspecTestsPassTask < Base
      def initialize(implementation_file_path:, test_command:)
        @implementation_file_path = implementation_file_path
        @test_command = test_command
      end

      def run
        loop do
          stdout, stderr, status = Sublayer::Actions::RunTestCommandAction.new(test_command: @test_command).call

          puts stdout
          puts stderr

          if status.exitstatus == 0
            puts "All tests pass!"
            return
          end

          modified_implementation = Sublayer::Generators::ModifiedImplementationToPassTestsGenerator.new(
            implementation_file_contents: File.read(@implementation_file_path),
            test_file_contents: File.read(@test_command.split(" ")[1]),
            test_output: stdout
          ).generate

          Sublayer::Actions::WriteFileAction.new(
            file_contents: modified_implementation,
            file_path: @implementation_file_path
          ).call
        end
      end
    end
  end
end
