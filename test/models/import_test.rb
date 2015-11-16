require 'test_helper'

class ImportTest < ActiveSupport::TestCase

  test "invalid without data" do
    import = Import.new
    assert !import.valid?, "Blank data are not valid"
  end

end
