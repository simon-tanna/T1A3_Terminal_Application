# These are the relative files required by the index
require_relative './seed.rb'
require_relative './classes/teams.rb'
require_relative './classes/game.rb'
require_relative './classes/players.rb'
require 'tty-prompt'
require 'colorize'
require 'artii'
require 'tty-progressbar'
require 'tty-font'
require 'faker'

#
game = seed
prompt = TTY::Prompt.new
ascii = Artii::Base.new
ascii_slant = Artii::Base.new :font => 'slant'
bar = TTY::ProgressBar.new("reloading options menu [:bar]", bar_format: :star, total: 15)
coin_bar = TTY::ProgressBar.new("Coin toss results processing [:bar]", bar_format: :box, total: 25)
starwars_font = TTY::Font.new(:starwars)


#Below are all methods used to run the game.

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

def team_attack_3(prompt,game,user_team,bot_team)
    attack_options = ["pass", "shoot"]
    attack = prompt.select("#{user_team} have the ball on the right hand side of the pitch. You have a team-mate in a good position outside the box but the opposing goalkeeper is off his line. Do you: ", attack_options)
    return attack
end

def team_defend_3(prompt,game,user_team,bot_team)
    defend_options = ["slide tackle", "block tackle"]
    defend = prompt.select("#{bot_team} are storming into your half of the field. Their striker is about to shoot from distance. Do you: ", defend_options)
    return defend
end

def team_extra_time(prompt,game,user_team,bot_team)
    attack_options = ["shoot left", "shoot right"]
    attack = prompt.select("You are one-on-one with the opposition goalkeeper. Do you: ", attack_options)
    return attack
end

def create_team(prompt,game,player_name,ascii_slant)
    puts ascii_slant.asciify("Time to Create Your Team of Legends!").colorize(:red)
    team_name = ""
    captain = "#{player_name}"
    team_new_players = []
    team_new_toss = ["heads", "tails"].sample
    team_attack_1 = ["pass", "shoot"].sample
    team_attack_2 = ["dribble then shoot", "shoot from range"].sample
    team_attack_3 = ["pass", "shoot"].sample
    team_defend_1 = ["slide tackle", "block tackle"].sample
    team_defend_2 = ["slide tackle", "block tackle"].sample
    team_defend_3 = ["slide tackle", "block tackle"].sample
    team_extra = ["shoot left", "shoot right"].sample
    choice_1 = Player.new("Pele", 10), Player.new("Diego Maradona", 10)
    choice_2 = Player.new("Bobby Moore", 6), Player.new("Franz Beckenbauer", 5)
    choice_3 = Player.new("Lev Yashin", 1), Player.new("Dino Zoff", 1)
    choice_4 = Player.new("Didier Deschamps", 7), Player.new("Paul Breitner", 8)
    choice_5 = Player.new("Cafu", 2), Player.new("Marco Tardelli", 14)
    puts "What would you like to call your team?"
    team_name = gets.chomp
    puts "Select your legends"
    team_new_players << prompt.select("Choose your destiny?", choice_1)
    team_new_players << prompt.select("Choose your destiny?", choice_2)
    team_new_players << prompt.select("Choose your destiny?", choice_3)
    team_new_players << prompt.select("Choose your destiny?", choice_4)
    team_new_players << prompt.select("Choose your destiny?", choice_5)
    team_user = Teams.new(team_name, team_new_players, 0, captain, team_new_toss, team_attack_1, team_attack_2, team_attack_3, team_defend_1, team_defend_2, team_defend_3, team_extra)
end

#This is the main menu of game options
def main_menu
    puts "1. View Rules".colorize(:green)
    puts "2. View Team Details".colorize(:green)
    puts "3. Begin Game".colorize(:green)
    puts "4. Exit Game".colorize(:green)
    print "Please select an option (1 - 4):"
    opt = gets.chomp
    return opt
end

# This is the method if user selects option 1 in main menu
def rules
    system "clear"
    puts "Hello World"
    puts "Press any key to return to the main menu"
    gets
    system "clear"
end

#this is the menu that lists the available teams and players
def info_menu(prompt,game,ascii)
    to_info = "y"
    while to_info == "y"
        system "clear"
        puts ascii.asciify("Team Information")
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
        sleep(0.05)
        coin_bar.advance
    end
    if toss == user_team.toss
        puts "You have won the toss... Prepare to kick off!"
        puts "PEEP!!!"
        puts "The referee blows the whistle to start the game. You are keeping posession of the ball well!"
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
            puts "GOAL"
            puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
        else
            puts "Your attacking raid has come to nothing and now #{bot_team} have posession..."
        end
        puts "Your defence is under-pressure!"
        defend_choice_2 = team_defend_2(prompt,game,user_team,bot_team)
        if defend_choice_2 != user_team.defend_2
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
            puts "GOAL"
            # puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
        else
            puts "Your attacking raid has come to nothing and the referee has blown for full time."
        end
    else
        puts "You lost the toss. #{bot_team} to kick off"
        puts "PEEP!!!"
        puts "The referee blows the whistle to start the game. Your opponents are keeping posession of the ball well!"
        puts "Prepare to defend!"
            defend_choice_1 = team_defend_1(prompt,game,user_team,bot_team)
            if defend_choice_1 != user_team.defend_1
                bot_team.score += 1
                puts "GOAL for #{bot_team}"
                puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
            else
                puts "You have executed a perfectly timed tackle and regained posession. Well done!"
            end
            puts "You are keeping posession in the midfield. Each pass finds a team=mate perfectly"
            attack_choice_1 = team_attack_1(prompt,game,user_team)
            if attack_choice_1 == user_team.attack_1
                user_team.score += 1
                puts "GOAL"
                puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
            else
                puts "You have given away position to the opposition..."
            end
            puts "Your defence is under-pressure!"
            defend_choice_2 = team_defend_2(prompt,game,user_team,bot_team)
            if defend_choice_2 != user_team.defend_2
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
                puts "GOAL"
                puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
            else
                puts "Your attacking raid has come to nothing and now #{bot_team} have posession..."
            end
            puts "Your opponent is launching one last counter-attack!"
            defend_choice_3 = team_defend_3(prompt,game,user_team,bot_team)
            if defend_choice_3 != user_team.defend_3
                bot_team.score += 1
                puts "GOAL for #{bot_team}"
                puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
            else
                puts "You have executed a perfectly timed tackle and regained posession. Well done!"
            end
    end
    if user_team.score == bot_team.score
        puts "The scores are as follows..."
        puts "#{user_team}: #{user_team.score}"
        puts "#{bot_team}: #{bot_team.score}"
        puts "The scores are level... Extra-Time"
        puts "The referee decides that #{user_team} have been the better behaved team and awards you the kick-off!"
        puts "PEEP! The referee's whistle blows and your team is immediately on the attack"
        extra_time_choice = team_extra_time(prompt,game,user_team,bot_team)
        if extra_time_choice == user_team.extra
            user_team.score += 1
            puts "GOAL!!!"
            puts "#{user_team} WINS"
            puts "Congratulations"
        else
            bot_team.score += 1
            puts "The goalkeeper saves!"
            puts "He spots his striker unmarked upfield and boots the ball towards him."
            puts "The opposition striker controls the ball...."
            puts "He spots your goalkeeper off his line and takes a long-range snapshot..."
            puts "GOAL! #{bot_team} WINS"
            puts "Better luck next time"
        end
    elsif user_team.score < bot_team.score
            puts "#{user_team}: #{user_team.score}"
            puts "#{bot_team}: #{bot_team.score}"
            puts "#{bot_team} are the winners!"
            puts "Better luck next time"
    else
        puts "#{user_team}: #{user_team.score}"
        puts "#{bot_team}: #{bot_team.score}"
        puts "#{user_team} are the winners!"
        puts "Congratulations"
    end
    print "Press any key to return to the main menu: "
    gets
end


system "clear"
#This is the main greeting
puts ascii.asciify("Welcome to Football Shootout").colorize(:green)
sleep(0.5)
puts ascii_slant.asciify("the greatest 5-a-side sim").colorize(:red)
sleep(0.5)
print "Please enter your name: "
player_name = gets.chomp
while player_name == ""
    print "You didn't enter a name. Please try again: "
    player_name = gets.chomp
end
# This is the case for the main options menu
option =""
while option != "4"
    puts "Thank you #{player_name} for choosing Football Shootout"
    sleep(0.5)
    puts "Select an option below to begin your journey to becoming a 5-a-side master:"
    option = main_menu
    case option
        when "1"
            rules
        when "2"
            info_menu(prompt,game,ascii)
        when "3"
            system "clear"
            user_team = create_team(prompt,game,player_name,ascii_slant)
            system "clear"
            puts ascii_slant.asciify("Your Team of Legends are...").colorize(:green)
            puts user_team.all_team_info
            print "Press any key to continue and select your opponent..."
            gets
            system "clear"
            bot_team = team_select_bot(prompt,game)
            system "clear"
            puts ascii_slant.asciify("Your Opponents are...").colorize(:red)
            puts bot_team.all_team_info
            print "Press any key to continue to the coin toss..."
            gets
            system "clear"
            toss = coin_toss(prompt,game)
            system "clear"
            main_game(prompt,game,toss,user_team,bot_team,coin_bar)
        when "4"
            puts "Are you sure you want to "
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