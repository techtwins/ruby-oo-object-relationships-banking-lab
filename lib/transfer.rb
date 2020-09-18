class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @amount = amount
    @receiver = receiver
    @sender = sender
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? ? true :false
  end

  def execute_transaction
    if @status != "complete"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    end

    if not valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end 

end
