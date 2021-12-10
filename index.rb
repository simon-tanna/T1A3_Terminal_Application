# These are the relative files required by the index
require_relative './seed.rb'
require 'tty-prompt'

game = seed
prompt = TTY::Prompt.new

puts "Welcome to #{game} ever!"
# def main_menu
#     puts 