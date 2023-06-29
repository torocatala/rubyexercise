class SimpleATM
    attr_reader :balance

    def initialize
      @balance = 100
    end
    
    def deposit(amount)
        @balance += amount
    end

    def withdraw(amount)
        if amount <= @balance
            @balance -= amount
            true
        else
            false
        end
    end
end