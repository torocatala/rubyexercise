require_relative '../model/SimpleATM'
require_relative '../view/SimpleATMView'

class SimpleATMController

    @simpleATM

    def initialize
        @simpleATM = SimpleATM.new
    end

    def get_user_input
        return gets.chomp.to_i
    end

    def handle_option(option)
        case option
        when 1
          balance = @simpleATM.balance
          SimpleATMView.display_balance(balance)
        when 2
          SimpleATMView.display_deposit_message
          amount = get_user_input
          @simpleATM.deposit(amount)
        when 3
          SimpleATMView.display_withdraw_message
          amount = get_user_input
          if @simpleATM.withdraw(amount)
            SimpleATMView.display_balance(@simpleATM.balance)
          else
            SimpleATMView.display_insufficient_funds_message
          end
        when 4
          SimpleATMView.display_exit_message
        else
          SimpleATMView.display_invalid_option_message(option)
        end
    end

    def display_menu
        SimpleATMView.display_menu
    end
end