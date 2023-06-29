class SimpleATMView

    def self.display_menu
        puts "###"
        puts "Please, enter the number related to the action you wish to do: "
        puts "1) Check Balance"
        puts "2) Deposit"
        puts "3) Withdraw"
        puts "4) Exit"
        puts "###"
    end

    def self.display_balance(balance)
        puts "Total balance is: #{balance}"
        puts ""
      end
    
      def self.display_deposit_message
        print "How much do you want to deposit? "
      end
    
      def self.display_withdraw_message
        print "How much do you want to withdraw? "
      end
    
      def self.display_insufficient_funds_message
        puts "Insufficient funds"
        puts ""
      end
    
      def self.display_invalid_option_message(option)
        puts "#{option} is an invalid option. Please enter a valid option from the menu."
        puts ""
      end
    
      def self.display_exit_message
        puts "Bye"
      end    
end