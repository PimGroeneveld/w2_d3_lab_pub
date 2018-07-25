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

  def test_customer_name()
    assert_equal("Nicola Sturgeon", @customer.customer_name)
  end

  def test_customer_wallet()
    assert_equal(50, @customer.wallet)
  end

  def test_customer_age()
    assert_equal(21, @customer.age)
  end

  def test_no_drinks()
    assert_equal(0, @customer.drink_count)
  end

  def test_no_drunk_level()
    assert_equal(0, @customer.drunk_level)
  end

  def test_buy_drink()
    @customer.buy_drink(@drink3, @pub, @customer)
    assert_equal(1, @customer.drink_count)
  end

  def test_cannot_buy_drink()
    @customer2.buy_drink(@drink3, @pub, @customer2)
    assert_equal(0, @customer2.drink_count)
  end

  def test_pay_pub()
    @customer.pay_pub(@drink3, @pub)
    assert_equal(47, @customer.wallet)
  end


end
