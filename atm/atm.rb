balance = 100
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

def check_balance(balance)
    puts "Total balance is: #{balance}"
    puts ""
end

def deposit(balance)
    print "How much do you want to deposit? "
    deposit_amount = gets.chomp.to_i
    balance += deposit_amount
    return balance
end

def withdraw(balance)
    print "How much do you want to withdraw? "
    withdraw_amount = gets.chomp.to_i
    if withdraw_amount <= balance
        balance -= withdraw_amount
    else
        puts "Insufficient funds"
    end
    return balance
end

while option != 4

    #Print menu
    display_menu

    #gets menu action
    option = gets.chomp.to_i
    puts ""
    #Controls flow from menu
    if option == 1
        check_balance(balance)
    elsif option == 2
        balance = deposit(balance)
    elsif option == 3
        balance = withdraw(balance)
    elsif option == 4
        puts "Bye"
    else
        puts "#{option} is and invalid option, please enter a valid option from the menu"
    end
end