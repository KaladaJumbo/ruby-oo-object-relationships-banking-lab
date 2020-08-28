require_relative './bank_account.rb'
require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  @@all = []

  def initialize (sender, receiver, amount)

    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount
    self.save

  end

  def self.all

    @@all

  end

  def save

    Transfer.all << self

  end

  def valid?

          #this is a bank_account's 
          #method
    if self.sender.valid? == true && self.receiver.valid? == true
      return true 
    else
      return false
    end

  end

  def execute_transaction

    if self.status == "pending" 

      if self.sender.balance >= self.amount && self.valid? 
        self.sender.deposit(self.amount * -1)
        self.receiver.deposit(self.amount)
        self.status = "complete"
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end

    end

  end

  def reverse_transfer

    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.deposit(self.amount * -1)
      self.status = "reversed"
    end

  end


end
