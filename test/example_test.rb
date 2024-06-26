require 'test_helper'

module Tddbot
  class ExampleTest < Minitest::Test
    include CLI::Kit::Support::TestHelper

    def test_example
      CLI::Kit::System.fake("ls -al", stdout: "a\nb", success: true)

      out, = CLI::Kit::System.capture2('ls', '-al')
      assert_equal %w(a b), out.split("\n")

      errors = assert_all_commands_run(should_raise: false)
      assert_nil errors, "expected command to run successfully"
    end
  end
end
