require 'minitest/autorun'
require_relative '../../model/SimpleATM'

class SimpleATMTest < Minitest::Test
  def setup
    @atm = SimpleATM.new
  end

  def test_initial_balance
    assert_equal 100, @atm.balance, "Initial balance should be 100"
  end

  def test_deposit
    @atm.deposit(50)
    assert_equal 150, @atm.balance, "Balance after depositing 50 should be 150"
  end

  def test_withdraw_success
    success = @atm.withdraw(50)
    assert_equal true, success, "Withdrawal should be successful"
    assert_equal 50, @atm.balance, "Balance after withdrawing 50 should be 50"
  end

  def test_withdraw_failure
    success = @atm.withdraw(200)
    assert_equal false, success, "Withdrawal should be unsuccessful"
    assert_equal 100, @atm.balance, "Balance should remain 100 after unsuccessful withdrawal"
  end
end