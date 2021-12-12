# These are the relative files required by the index
require_relative './seed.rb'
require_relative './classes/teams.rb'
require_relative './classes/game.rb'
require_relative './classes/players.rb'
require_relative './classes/game_events.rb'
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
coin_bar = TTY::ProgressBar.new("Coin toss results processing [:bar]", bar_format: :box, total: 25)
# puts game
# puts game.print_teams

#This is the option for the user to select a team.
def team_select_info(prompt,game)
    team = prompt.select("Choose a team to view the line-up...(use ↑/↓ arrows on your keyboard)", game.print_teams)
    return team
end

def team_select_user(prompt,game)
    user_team = prompt.select("Choose your team...(use ↑/↓ arrows on your keyboard)", game.print_teams)
    return user_team
end

def team_select_bot(prompt,game)
    bot_team = prompt.select("Choose your opponent...(use ↑/↓ arrows on your keyboard)", game.print_teams)
    return bot_team
end

def coin_toss(prompt,game)
    coin_options = ["heads", "tails"]
    toss = prompt.select("Choose heads or tails to decide who kicks off!", coin_options)
    return toss
end

def team_attack_1(prompt,game,user_team)
    attack_options = ["pass", "shoot"]
    attack = prompt.select("#{user_team} have the ball on the right hand side of the pitch. You have a team-mate in a good position outside the box but the opposing goalkeeper is off his line. Do you: ", attack_options)
    return attack
end

def team_defend_1(prompt,game,user_team,bot_team)
    defend_options = ["slide tackle", "block tackle"]
    defend = prompt.select("#{bot_team} are looking dangerous and are taking the ball into the final third of the pitch. The winger is looking to go past you. Do you: ", defend_options)
    return defend
end

def team_attack_2(prompt,game,user_team,bot_team)
    attack_options = ["dribble then shoot", "shoot from range"]
    attack = prompt.select("#{user_team} have opened up space in the middle of the pitch. There is gaping hole in their defence with no team mates near you. Do you: ", attack_options)
    return attack
end

def team_defend_2(prompt,game,user_team,bot_team)
    defend_options = ["slide tackle", "block tackle"]
    defend = prompt.select("#{bot_team} have broken away and you are now the only player between their striker and the goal! Do you: ", defend_options)
    return defend
end

def team_attack_3(prompt,game,user_team)
    attack_options = ["pass", "shoot"]
    attack = prompt.select("#{user_team} have the ball on the right hand side of the pitch. You have a team-mate in a good position outside the box but the opposing goalkeeper is off his line. Do you: ", attack_options)
    return attack
end

def team_defend_3(prompt,game,user_team,bot_team)
    defend_options = ["slide tackle", "block tackle"]
    defend = prompt.select("#{bot_team} are looking dangerous and are taking the ball into the final third of the pitch. The winger is looking to go past you. Do you: ", defend_options)
    return defend
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

# This is the method if user selects option 1 in main menu
def rules
    puts "Hello World"
    puts "Press any key to return to the main menu"
    gets
end

#this is the menu that lists the available teams and players
def info_menu(prompt,game)
        to_info = "y"
        while to_info == "y"
            system "clear"
            puts "Team Information"
            team = team_select_info(prompt,game)
            puts team.all_team_info
            begin
            puts "Would you like to view another team? (press 'y' then enter to view another team. press 'n' then enter to return to the main menu"
            to_info = gets.chomp
                if to_info != "n" && to_info != "y"
                    raise StandardError
                end
                if to_info == ""
                    raise ArgumentError
                end
                rescue ArgumentError
                    system "clear"
                    puts "You didn't enter an option! Please select 'y' or 'n' before pressing enter"
                    retry
                rescue StandardError
                    system "clear"
                    puts "You didn't enter a valid option! Please select 'y' or 'n' before pressing enter"
                    retry
                end
            end
            system "clear"
end

# This is the method if the user selects option 3 in the main menu
def main_game(prompt,game,toss,user_team,bot_team,coin_bar)
    25.times do
        sleep(0.1)
        coin_bar.advance
    end
    if toss == user_team.toss
        puts "You have won the toss... Prepare to kick off!"
        attack_choice_1 = team_attack_1(prompt,game,user_team)
        if attack_choice_1 == user_team.attack_1
            user_team.score += 1
            puts "GOAL"
            puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
        else
            puts "You have given away position to the opposition..."
        end
        puts "Prepare to defend!"
        defend_choice_1 = team_defend_1(prompt,game,user_team,bot_team)
        if defend_choice_1 != user_team.defend_1
            bot_team.score += 1
            puts "GOAL for #{bot_team}"
            puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
        else
            puts "You have executed a perfectly timed tackle and regained posession. Well done!"
        end
        puts "Your team is now again on the attack!"
        attack_choice_2 = team_attack_2(prompt,game,user_team,bot_team)
        if attack_choice_2 == user_team.attack_2
            user_team.score += 1
            puts "GOAL your #{attack}"
            puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
        else
            puts "Your attacking raid has come to nothing and now #{bot_team} have posession..."
        end
        puts "Your defence is under-pressure!"
        defend_choice_2 = team_defend_2(prompt,game,user_team,bot_team)
        if defend_choice_2 != user_team.defend_1
            bot_team.score += 1
            puts "GOAL for #{bot_team}"
            puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
        else
            puts "You have executed a perfectly timed tackle and regained posession. Well done!"
        end
        puts "Your team is has time for one final attack!"
        attack_choice_3 = team_attack_3(prompt,game,user_team,bot_team)
        if attack_choice_3 == user_team.attack_3
            user_team.score += 1
            puts "GOAL your #{attack}"
            puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
        else
            puts "Your attacking raid has come to nothing and the referee has blown for full time."
        end
    else
        puts "You lost the toss. #{bot_team} to kick off"
    end
end
#     toss_result = ["heads", "tails"].sample
#         if toss_result == 
#     #here the code for the coin toss result will sit
# end

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
            user_team = team_select_user(prompt,game)
            bot_team = team_select_bot(prompt,game)
            toss = coin_toss(prompt,game)
            main_game(prompt,game,toss,user_team,bot_team,coin_bar)
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