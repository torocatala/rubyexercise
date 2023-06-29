balance = 100
option = -1

while option != 4

    #Print menu
    puts "Please, enter the number related to the action you wish to do: "
    puts "1) Check Balance"
    puts "2) Deposit"
    puts "3) Withdraw"
    puts "4) Exit"

    #gets menu action
    option = gets.chomp.to_i
    puts 
    #Controls flow from menu
    if option == 1
        puts "Total balance is: #{balance}"
        puts ""
    elsif option == 2
        print "How much do you want to deposit? "
        deposit_amount = gets.chomp.to_i
        balance += deposit_amount
    elsif option == 3
        print "How much do you want to withdraw? "
        withdraw_amount = gets.chomp.to_i
        if withdraw_amount <= balance
            balance -= withdraw_amount
        else
            puts "Insufficient funds"
        end
    elsif option == 4
        puts "Bye"
    else
        puts "#{option} is and invalid option, please enter a valid option from the menu"
    end
end