require("minitest/autorun")
require_relative("../drink")

class DrinkTest < MiniTest::Test

  def setup
    @drink = Drink.new("beer", 5, 40)
  end

  def test_drink_name()
    assert_equal("beer", @drink.drink_name())
  end

  def test_drink_price()
    assert_equal(5, @drink.drink_price())
  end

  def test_alc_level()
    assert_equal(40, @drink.alc_level)
  end


end
