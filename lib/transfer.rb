require_relative "bank_account"

class Transfer
  attr_reader :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    @sender.status == "open" && @receiver.status == "open" ? true : false
    
    # This is redunant to the expression above
    # This calls on BankAccount's #valid? 
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    # if @sender.balance <= 0 || @receiver.balance <= 0
    #   @status = "rejected"
    #   "Transaction rejected. Please check your account balance."
    # elsif @status != "complete" && @status != "rejected"
    #   @sender.balance -= amount
    #   @receiver.balance += amount
    #   @status = "complete"
    # else
    #   "You cannot do the same transfer"
    # end

    if self.valid? && @status == "pending" && @sender.balance > amount
      @sender.deposit(-amount)
      @receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(amount)
      @receiver.deposit(-amount)
      @status = "reversed"
    end
  end



end
