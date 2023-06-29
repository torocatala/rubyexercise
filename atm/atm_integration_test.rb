# integration_test.rb

require 'open3'
require 'minitest/autorun'

class ATMIntegrationTest < Minitest::Test
  def test_balance_check
    input = "1\n4\n"
    menu = "\nPlease, enter the number related to the action you wish to do: \n" \
                      "1) Check Balance\n2) Deposit\n3) Withdraw\n4) Exit\n"
                      
    balance = "\n\nTotal balance is: 100\n\n"
    
    output, _, _ = Open3.capture3("ruby atm.rb", :stdin_data => input)

    output_lines = output.split("###")

    assert_equal menu, output_lines[1]
    assert_equal balance, output_lines[2]
  end

  def test_deposit
    input = "1\n2\n50\n1\n4\n"
    menu = "\nPlease, enter the number related to the action you wish to do: \n" \
                      "1) Check Balance\n2) Deposit\n3) Withdraw\n4) Exit\n"
                      
    balance = "\n\nTotal balance is: 150\n\n"
    
    output, _, _ = Open3.capture3("ruby atm.rb", :stdin_data => input)

    output_lines = output.split("###")

    assert_equal menu, output_lines[1]
    assert_equal balance, output_lines[6]
  end

  def test_withdraw
    input = "1\n3\n50\n1\n4\n"
    menu = "\nPlease, enter the number related to the action you wish to do: \n" \
                      "1) Check Balance\n2) Deposit\n3) Withdraw\n4) Exit\n"
                      
    balance = "\n\nTotal balance is: 50\n\n"
    
    output, _, _ = Open3.capture3("ruby atm.rb", :stdin_data => input)

    output_lines = output.split("###")

    assert_equal menu, output_lines[1]
    assert_equal balance, output_lines[6]
  end

  def test_withdraw_insufficient_funds
    input = "1\n3\n150\n1\n4\n"
    menu = "\nPlease, enter the number related to the action you wish to do: \n" \
                      "1) Check Balance\n2) Deposit\n3) Withdraw\n4) Exit\n"
    insufficient_funds = "\n\nHow much do you want to withdraw? Insufficient funds\n"
    balance = "\n\nTotal balance is: 100\n\n"
    
    output, _, _ = Open3.capture3("ruby atm.rb", :stdin_data => input)

    output_lines = output.split("###")

    assert_equal menu, output_lines[1]
    assert_equal insufficient_funds, output_lines[4]
    assert_equal balance, output_lines[6]
  end

  def test_exit
    input = "4\n"
    menu = "\nPlease, enter the number related to the action you wish to do: \n" \
                      "1) Check Balance\n2) Deposit\n3) Withdraw\n4) Exit\n"
    bye = "\n\nBye\n";
    
    output, _, _ = Open3.capture3("ruby atm.rb", :stdin_data => input)

    output_lines = output.split("###")

    assert_equal menu, output_lines[1]
    assert_equal bye, output_lines[2]
  end

  def test_invalid_option
    input = "69\n"
    menu = "\nPlease, enter the number related to the action you wish to do: \n" \
                      "1) Check Balance\n2) Deposit\n3) Withdraw\n4) Exit\n"
    error = "\n\n69 is and invalid option, please enter a valid option from the menu\n";
    
    output, _, _ = Open3.capture3("ruby atm.rb", :stdin_data => input)

    output_lines = output.split("###")

    assert_equal menu, output_lines[1]
    assert_equal error, output_lines[2]
  end
end