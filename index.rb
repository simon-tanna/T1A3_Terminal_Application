# These are the relative files required by the index
require_relative './seed.rb'
require_relative './classes/teams.rb'
require_relative './classes/game.rb'
require_relative './classes/players.rb'
require 'tty-prompt'
require 'colorize'
require 'artii'
require 'tty-progressbar'

#
game = seed
prompt = TTY::Prompt.new
ascii = Artii::Base.new
ascii_slant = Artii::Base.new :font => 'slant'
bar = TTY::ProgressBar.new("reloading options menu [:bar]", bar_format: :star, total: 15)

# puts game
# puts game.print_teams

#This is the option for the user to select a team.
def team_select(prompt,game)
    team = prompt.select("Choose a team to view the line-up...(use ↑/↓ arrows on your keyboard)", game.print_teams)
    return team
end

#This is the main greeting
puts ascii.asciify("Welcome to Football Shootout").colorize(:blue)
sleep(0.5)
puts ascii_slant.asciify("the greatest 5-a-side sim").colorize(:red)
sleep(0.5)
#This is the main menu of game options
def main_menu
    puts "1. View Rules"
    puts "2. View Team Details"
    puts "3. Begin Game"
    puts "4. Exit Game"
    print "Please select an option (1 - 4):"
    opt = gets.chomp
    return opt
end
#this is the menu that lists the available teams and players
def info_menu(prompt,game)
        to_info = "y"
        while to_info == "y"
            puts "Team Information"
            team = team_select(prompt,game)
            puts team.all_team_info
            begin
            puts "Would you like to view another team? (press 'y' then enter to view another team. press 'n' then enter to return to the main menu"
            to_info = gets.chomp
                if to_info == "n"
                    puts "invalide"
                else
                end
                if to_info == ""
                    raise ArgumentError
                end
                rescue ArgumentError
                    system "clear"
                    puts "You didn't enter an option! Please select 'y' or 'n' before pressing enter"
                    retry
                end
            end
end
#                 end     
# end
# end
# This is the method if user selects option 1 in main menu
def rules
    puts "Hello World"
    puts "Press any key to return to the main menu"
    gets
end

# This is the method if the user selects option 2 in the main menu
# def team_details(prompt)
#     @teams.each do |team|
#         team.name
#     end
# end

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
            rules
        when "2"
            info_menu(prompt,game)
        when "3"
            main_game(game)
        when "4"
            next
        else
            puts "Invalid option".colorize(:red)
            sleep(1.5)
            puts "Please select 1, 2, 3 or 4!"
            sleep(1.5)
            15.times do
                sleep(0.2)
                bar.advance  # by default increases by 1
            end
            system "clear"
    end
end
puts "goodbye"

        

        

# puts game.print_teams