
require 'tty-prompt'
require 'colorize'
require 'artii'
require 'tty-progressbar'


prompt = TTY::Prompt.new

def coin_toss(prompt)
    coin_options = ["heads", "tails"]
    toss = prompt.select("Choose heads or tails to decide who kicks off!", coin_options)
    return toss
end



toss_result = ["heads", "tails"].sample
if toss_result == coin_toss(prompt)
    puts "You Win"
else
    puts "You Lose"
end