require 'test_helper'

class BuyerTest < ActiveSupport::TestCase
  test "invalid without a name" do
    buyer = Buyer.new
    assert !buyer.valid?, "Name is not being validated"
  end
end
