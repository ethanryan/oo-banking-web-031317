class BankAccount

  attr_reader :name #reader instead of accessor cuz don't want users changing their names
                    #and cuz for now, just want to get it passing with minimal number of methods
                    #accessor would create two methods, reader and writer

  attr_accessor :balance, :status #accessor cuz balance will change

  def initialize(name)
    @name = name
    @balance = 1000 #@balance == self.balance <<<---this is the reader method (correct??)
    @status = 'open'
  end #end method

  def deposit(amount)
    #@balance += amount #this works, but better to use self.balance below, so the method balance is being called on instances instead of using the instance variable balance
    ## is self.balance THE SAME AS @balance???
    self.balance += amount #need self to call method on each instance of bank account
    #self.balance=(balance + amount) ###above line is same as this
    #self.balance= above is the reader method (correct??)
    #(balance + amount) is the writer method  (correct??)
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid? #question mark means a boolean, want to return true or false
    status == "open" && balance > 0 #don't need below, this is all you need here, cuz it returns true if true, false if not
    # if status == "open" && balance > 0
    #   true
    # else
    #   false
    # end #end if else
  end

  def close_account
    self.status = "closed"
  end

end #end class
