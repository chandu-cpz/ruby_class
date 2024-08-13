
class Bank
  attr_accessor :accounts

  def initialize
    @accounts = []
  end

  def addAccount(name, accountNumber)
    @accounts << { accountNumber: accountNumber, owner: name, balance: 0 }
  end

  def addBalance(accountNumber, balance)
    account = findAccount(accountNumber)
    account ? account[:balance] += balance : puts("Account not found")
  end

  def getBalance(accountNumber)
    account = findAccount(accountNumber)
    account ? account[:balance] : "There is no account with #{accountNumber}"
  end

  def withdraw(accountNumber, amount)
    account = findAccount(accountNumber)
    if account
      if amount > account[:balance]
        puts "Insufficient balance, withdrawal failed."
      else
        account[:balance] -= amount
      end
    else
      puts "There is no account with #{accountNumber}"
    end
  end

  def accountDetails(accountNumber)
    account = findAccount(accountNumber)
    if account
      puts "AccountHolder: #{account[:owner]}"
      puts "Balance: #{account[:balance]}"
    else
      puts "Account not found"
    end
  end

  private

  def findAccount(accountNumber)
    @accounts.find { |account| account[:accountNumber] == accountNumber }
  end
end

chandrakanthBank = Bank.new
chandrakanthBank.addAccount("Chandrakanth", 453)
chandrakanthBank.addAccount("Chaitanya", 456)
chandrakanthBank.addBalance(453, 500)
chandrakanthBank.addBalance(456, 300)

puts "Account Details for Account 123:"
chandrakanthBank.accountDetails(453)

puts "Account Details for Account 456:"
chandrakanthBank.accountDetails(456)

puts "Attempting withdrawal from Account 123:"
chandrakanthBank.withdraw(453, 200)

puts "Updated Account Details for Account 123:"
chandrakanthBank.accountDetails(453)

puts "Attempting withdrawal from Account 123 with insufficient funds:"
chandrakanthBank.withdraw(453, 400)

puts "\nFinal Account Details for Account 123:"
chandrakanthBank.accountDetails(453)

