class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name,balance=1000,status="open")
        @name = name
        @balance = balance
        @status = status
    end


    def deposit(money)
        @balance += money #money is being added to balance.. Don't use self, b/c @balance exists in initialize.
    end
  
    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        if @balance > 0 && @status == "open"
            return true
        else
            return false
        end
    end

    def close_account
        @status = "closed"
    end


  
  
  
  end
  