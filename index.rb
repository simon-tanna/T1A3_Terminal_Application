# These are the relative files required by the index
require_relative './seed.rb'
require 'tty-prompt'
require 'colorize'
require 'artii'

#
game = seed
prompt = TTY::Prompt.new
ascii = Artii::Base.new
ascii_slant = Artii::Base.new :font => 'slant'

#This is the main greeting
puts ascii.asciify("Welcome to Football Shootout").colorize(:blue)
sleep(0.5)
puts ascii_slant.asciify("the greatest 5-a-side sim").colorize(:red)
sleep(0.5)
def main_menu
    puts "1. View Rules"
    puts "2. View Team Details"
    puts "3. Begin Game"
    puts "4. Exit Game"
    print "Please select an option (1 - 4):"
    opt = gets.chomp
    return opt
end

# This is the method if user selects option 1 in main menu
def rules(game)

end

# This is the method if the user selects option 2 in the main menu
def team_details(game)
    
end

# This is the method if the user selects option 3 in the main menu
def main_game(game)

end

# This is the case for the main options menu
option =""
while option != "4"
    puts "Select an option below to begin your journey to becoming a 5-a-side master:"
    option = main_menu
    case option
        when "1"
            rules(game)
        when "2"
            team_details(game)
        when "3"
            main_game(game)
        when "4"
            next
        else
            puts "Invalid option".colorize(:red)
            sleep(1.5)
            puts "Please select 1, 2, 3 or 4!"
            sleep(1.5)
            print "Reloading Options Menu."
            sleep(0.5)
            print "."
            sleep(0.5)
            print "."
            sleep(0.5)
            print "."
            sleep(0.5)
            system "clear"
    end
end

        

        

# puts game.print_teams