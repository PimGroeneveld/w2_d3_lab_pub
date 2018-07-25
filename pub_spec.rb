require("minitest/autorun")
require_relative("../pub")
require_relative("../drink")
require_relative("../customer")


class PubTest < MiniTest::Test

  def setup
    @customer = Customer.new("Nicola Sturgeon", 50, 21)
    @customer2 = Customer.new("Donald Trump", 1000000, 12)

    @drink1 = Drink.new("beer", 5, 4)
    @drink2 = Drink.new("wine", 4, 10)
    @drink3 = Drink.new("tequila", 3, 40)

    @pub = Pub.new("Puzzles", 200, [@drink1, @drink2, @drink3])
  end

  def test_pub_name()
    assert_equal("Puzzles", @pub.pub_name)
  end

  def test_till_content()
    assert_equal(200, @pub.till_content)
  end

  def test_drinks_count()
    assert_equal(3, @pub.drinks_count)
  end

  def test_sell_drinks()
    @pub.sell_drink(@drink3, @customer)
    assert_equal(2, @pub.drinks_count)
  end

  def test_return_drink()
    ordered_drink = @pub.sell_drink(@drink3, @customer)
    assert_equal(@drink3, ordered_drink)
  end

  def test_till_increase()
    @pub.till_increase(@drink3)
    assert_equal(203, @pub.till_content)
  end

  def test_age_customer_accept()
    result = @pub.check_age(@customer)
    assert_equal(true, result)
  end

  def test_age_customer_deny()
    result = @pub.check_age(@customer2)
    assert_equal(false, result)
  end

  def test_customer_underage__deny()
    @pub.sell_drink(@drink3, @customer2)
    assert_equal(3, @pub.drinks_count)
  end



end
