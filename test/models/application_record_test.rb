# frozen_string_literal: true

require "test_helper"

class ApplicationRecordTest < ActiveSupport::TestCase
  test "should be abstract class" do
    assert_raises(NotImplementedError) { ApplicationRecord.new }
  end
end
