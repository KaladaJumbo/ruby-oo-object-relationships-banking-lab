require_relative './transfer.rb'

class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    @@all = []

    def initialize (name)

        @name = name
        @balance = 1000
        @status = "open"
        self.save
    end

    def self.all

        @@all

    end


    def save 

        BankAccount.all << self

    end

    def deposit(amount)

        self.balance += amount 

    end

    def display_balance 

        "Your balance is $#{self.balance}."

    end


    def valid?

        if self.balance > 0 && self.status == "open"
            return true
        else 
            return false
        end

    end


    def close_account

        self.status = "closed"

    end




end
