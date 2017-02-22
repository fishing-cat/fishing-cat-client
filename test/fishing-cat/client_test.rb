require 'test_helper'

class FishingCat::ClientTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil FishingCat::Client::VERSION
  end
end
