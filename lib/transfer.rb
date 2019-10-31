class Transfer
 
  attr_accessor :status, :amount
  attr_reader  :sender, :receiver 

  def initialize(sender, receiver, status='pending', amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid? 
      return true
    else 
      return false
    end 

  end

  def execute_transaction
     if @status == "pending" && valid? && @sender.balance >= @amount 
      @sender.balance -= @amount
      @receiver.balance += @amount 
      @status = "complete"
     else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
     end 
  end 

  def reverse_transfer
    if @status == 'complete' && valid? && @receiver.balance >= @amount 
      @sender.balance += @amount
      @receiver.balance -= @amount 
      @status = "reversed"
     else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
     end 
  end 


end
