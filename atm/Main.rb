require_relative 'controller/SimpleATMController'

simpleATMController = SimpleATMController.new

option = -1
while option != 4
    simpleATMController.display_menu
    option = simpleATMController.get_user_input
    simpleATMController.handle_option(option)
end