require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  test "invalid without a name" do
    buyer = Buyer.new
    assert !buyer.valid?, "Name is not being validated"
  end
end
