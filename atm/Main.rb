require_relative 'model/SimpleATM'

simpleATM = SimpleATM.new
option = -1

def display_menu
    puts "###"
    puts "Please, enter the number related to the action you wish to do: "
    puts "1) Check Balance"
    puts "2) Deposit"
    puts "3) Withdraw"
    puts "4) Exit"
    puts "###"
end

def check_balance(simpleATM)
    puts "Total balance is: #{simpleATM.balance}"
    puts ""
end

def deposit(simpleATM)
    print "How much do you want to deposit? "
    deposit_amount = gets.chomp.to_i
    simpleATM.deposit(deposit_amount)
end

def withdraw(simpleATM)
    print "How much do you want to withdraw? "
    withdraw_amount = gets.chomp.to_i
    if !simpleATM.withdraw(withdraw_amount)
        puts "Insufficient funds"
    end
end

while option != 4

    #Print menu
    display_menu

    #gets menu action
    option = gets.chomp.to_i
    puts ""
    #Controls flow from menu
    if option == 1
        check_balance(simpleATM)
    elsif option == 2
        deposit(simpleATM)
    elsif option == 3
        withdraw(simpleATM)
    elsif option == 4
        puts "Bye"
    else
        puts "#{option} is and invalid option, please enter a valid option from the menu"
    end
end