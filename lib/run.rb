require "pry"
require_relative "bank_account"
require_relative "transfer"

megan = BankAccount.new("Megan", balance = 200)

will = BankAccount.new("Will", balance = 100)

will_to_megan_transfer = Transfer.new(will, megan, 50)



binding.pry
puts "bank transfer"