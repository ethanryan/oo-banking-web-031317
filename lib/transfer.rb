class Transfer

  attr_reader :receiver, :sender, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @receiver = receiver
    @sender = sender
    @amount = amount
    @status = "pending"
  end

  def valid? #isn't it confusing to use same method name in both classes???
    #receiver.valid? && sender.valid?
    self.receiver.valid? && self.sender.valid?
    #self is implicit above, can do with or without, adding to make explicit
    #.receiver and .sender are being called on BankAccount class instances
  end

  def execute_transaction
    if self.valid? == true && self.sender.balance > amount && self.status == "pending"
      self.sender.balance -= self.amount   #decreases by amount
      self.receiver.balance += self.amount #increases by amount
      self.status = "complete" #transfer complete
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end #end if statement
  end

  def reverse_transfer
    if self.status == "complete" #if transfer was completed...
      self.sender.balance += self.amount   #increase by amount
      self.receiver.balance -= self.amount #decrease by amount
      self.status = "reversed" #reversed transfer
    end #end if statement
  end

end #end class
