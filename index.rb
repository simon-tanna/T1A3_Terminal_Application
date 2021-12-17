# These are the relative files required by the index
require_relative './seed.rb'
require_relative './classes/teams.rb'
require_relative './classes/game.rb'
require_relative './classes/players.rb'
# These are the Ruby Gems required by the app
require 'tty-prompt'
require 'colorize'
require 'artii'
require 'tty-progressbar'
require 'tty-font'
require 'faker'

# These are the variables required by the game
game = seed # This variable is from the seed.rb file
prompt = TTY::Prompt.new
ascii = Artii::Base.new
ascii_slant = Artii::Base.new :font => 'slant'
bar = TTY::ProgressBar.new("reloading options menu [:bar]", bar_format: :star, total: 15)
coin_bar = TTY::ProgressBar.new("Coin toss results processing [:bar]", bar_format: :box, total: 25)
kickoff_bar = TTY::ProgressBar.new("Preparing to kick-off: [:bar]", bar_format: :box, total: 35)
phase_bar = TTY::ProgressBar.new("Loading next phase of play: [:bar]", bar_format: :box, total: 35)
results_bar = TTY::ProgressBar.new("Processing Result: [:bar]", bar_format: :box, total: 35)
sw_font = TTY::Font.new(:straight)

# The is the statement invoking the argument inputted by the user
if ARGV.length > 0
    first_name = ARGV[0]
    second_name = ARGV[1]
    player_name = first_name + " " + second_name
else
    player_name = "Football Fan"
end
ARGV.clear

# Below are all methods used to run the game.
# This is the method used by the team info menu selection to populate the bot team information list
def team_select_info(prompt,game)
    team = prompt.select("Choose a team to view the line-up...(use ↑/↓ arrows on your keyboard)", game.print_teams)
    return team
end

# def team_select_user(prompt,game)
#     user_team = prompt.select("Choose your team...(use ↑/↓ arrows on your keyboard)", game.print_teams)
#     return user_team
# end

# This is the method used by the main game to select the bot team
def team_select_bot(prompt,game)
    bot_team = prompt.select("Choose your opponent...(use ↑/↓ arrows on your keyboard)", game.print_teams)
    return bot_team
end

# This is the method used to prompt the user for a heads or tails answer in the coin toss feature
def coin_toss(prompt,game)
    coin_options = ["heads", "tails"]
    toss = prompt.select("Choose heads or tails to decide who kicks off!", coin_options)
    return toss
end

# The next 6 methods are used by the game to prompt the user for a gameplay decision, returning a true of false 
# variable to be matched against a randomly assigned variable in the user team
def team_attack_1(prompt,game,user_team)
    attack_options = ["pass", "shoot"]
    attack = prompt.select("#{user_team} have the ball on the right hand side of the pitch. 
             You have a team-mate in a good position outside the box but the opposing goalkeeper is off his line. Do you: ", attack_options)
    return attack
end

def team_defend_1(prompt,game,user_team,bot_team)
    defend_options = ["slide tackle", "block tackle"]
    defend = prompt.select("#{bot_team} are looking dangerous and are taking the ball into the final third of the pitch. 
             The winger is looking to go past you. Do you: ", defend_options)
    return defend
end

def team_attack_2(prompt,game,user_team,bot_team)
    attack_options = ["dribble then shoot", "shoot from range"]
    attack = prompt.select("#{user_team} have opened up space in the middle of the pitch. 
             There is gaping hole in their defence with no team mates near you. Do you: ", attack_options)
    return attack
end

def team_defend_2(prompt,game,user_team,bot_team)
    defend_options = ["slide tackle", "block tackle"]
    defend = prompt.select("#{bot_team} have broken away and you are now the only player between
             their striker and the goal! Do you: ", defend_options)
    return defend
end

def team_attack_3(prompt,game,user_team,bot_team)
    attack_options = ["pass", "shoot"]
    attack = prompt.select("#{user_team} have the ball on the right hand side of the pitch. You have a team-mate in 
             a good position outside the box but the opposing goalkeeper is off his line. Do you: ", attack_options)
    return attack
end

def team_defend_3(prompt,game,user_team,bot_team)
    defend_options = ["slide tackle", "block tackle"]
    defend = prompt.select("#{bot_team} are storming into your half of the field. Their striker is about to 
             shoot from distance. Do you: ", defend_options)
    return defend
end

# This is the method invoked if extra-time is required
def team_extra_time(prompt,game,user_team,bot_team)
    attack_options = ["shoot left", "shoot right"]
    attack = prompt.select("You are one-on-one with the opposition goalkeeper. Do you: ", attack_options)
    return attack
end

# This is the method used to create a playable user team
def create_team(prompt,game,player_name,ascii_slant)
    puts ascii_slant.asciify("Create Your").colorize(:red)
    puts ascii_slant.asciify("Team of Legends!").colorize(:red)
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
    choice_1 = Player.new("Pele", 10), Player.new("Diego Maradona", 10), Player.new("Johann Cruyff", 14)
    choice_2 = Player.new("Bobby Moore", 6), Player.new("Franz Beckenbauer", 5), Player.new("Paolo Maldini", 3)
    choice_3 = Player.new("Lev Yashin", 1), Player.new("Dino Zoff", 1), Player.new("Gordon Banks", 1)
    choice_4 = Player.new("Didier Deschamps", 7), Player.new("Paul Breitner", 8), Player.new("Andrea Pirlo", 21)
    choice_5 = Player.new("Cafu", 2), Player.new("Carlos Alberto", 4), Player.new("Roberto Carlos", 4)
    begin
    puts "What would you like to call your team?"
    team_name = gets.chomp
        if team_name == ""
            raise ArgumentError
        end
        rescue ArgumentError
            system "clear"
            puts "You didn't enter a team name. Please try again!"
            retry
        end
    puts "Select your legends"
    team_new_players << prompt.select("Choose your star striker: ", choice_1)
    team_new_players << prompt.select("Choose your defensive rock: ", choice_2)
    team_new_players << prompt.select("Choose your iron-gloved goalkeeper: ", choice_3)
    team_new_players << prompt.select("Choose your midfield general: ", choice_4)
    team_new_players << prompt.select("Choose your rampaging full-back: ", choice_5)
    team_user = Teams.new(team_name, team_new_players, 0, captain, team_new_toss, team_attack_1, 
                team_attack_2, team_attack_3, team_defend_1, team_defend_2, team_defend_3, team_extra)
end

# This is the main menu of game options
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

# This is the menu that lists the available teams and players
def info_menu(prompt,game,ascii)
    to_info = "y"
    while to_info == "y"
        system "clear"
        puts ascii.asciify("Team Information")
        team = team_select_info(prompt,game)
        puts team.all_team_info
        # This is the error handling for the team info menu
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
# It is the code that runs the main game from start to finish
def main_game(prompt,game,toss,user_team,bot_team,coin_bar,ascii,kickoff_bar,ascii_slant,phase_bar,results_bar)
    25.times do
        sleep(0.05)
        coin_bar.advance
    end
    # This if statement is determines the order of play based upon which team won the toss
    if toss == user_team.toss
        puts ascii.asciify("You have...").colorize(:green)
        sleep(1.5)
        puts ascii.asciify("won the toss!").colorize(:green)
        # This is the progress bar informing the user that the game is about to begin
        35.times do
            sleep(0.03)
            kickoff_bar.advance
        end
        system "clear"
        # Here the game kicks off
        puts ascii_slant.asciify("PEEP!!!").colorize(:blue)
        sleep(0.4)
        puts "The referee blows the whistle to start the game. You are keeping posession of the ball well!".colorize(:green)
        sleep(2)
        system "clear"
        # This is the first attacking phase of play if the toss was won
        attack_choice_1 = team_attack_1(prompt,game,user_team)
        if attack_choice_1 == user_team.attack_1
            user_team.score += 1
            puts ascii.asciify("GOAL!!!").colorize(:green)
            sleep(1.5)
            puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
            sleep(1.5)
        else
            puts "You have given away position to the opposition...".colorize(:red)
            sleep(2)
        end
        # This is the progress bar informing the user that the next phase of play is about to begin
        35.times do
            sleep(0.04)
            phase_bar.advance
        end
        phase_bar.reset
        system "clear"
        puts "Prepare to defend!".colorize(:red)
        sleep(2)
        # This is the first defensive phase of play if the toss was won
        defend_choice_1 = team_defend_1(prompt,game,user_team,bot_team)
        if defend_choice_1 != user_team.defend_1
            bot_team.score += 1
            puts ascii_slant.asciify("GOAL for").colorize(:red)
            puts ascii_slant.asciify("#{bot_team}").colorize(:red)
            sleep(1.5)
            puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
            sleep(1.5)
        else
            puts "You have executed a perfectly timed tackle and regained posession. Well done!".colorize(:green)
            sleep(2)
        end
        # This is the progress bar informing the user that the next phase of play is about to begin
        35.times do
            sleep(0.04)
            phase_bar.advance
        end
        phase_bar.reset
        system "clear"
        puts "Your team is now again on the attack!".colorize(:green)
        sleep(2)
        # This is the second attacking phase of play if the toss was won
        attack_choice_2 = team_attack_2(prompt,game,user_team,bot_team)
        if attack_choice_2 == user_team.attack_2
            user_team.score += 1
            puts ascii.asciify("GOAL!!!").colorize(:green)
            sleep(1.5)
            puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
            sleep(1.5)
        else
            puts "Your attacking raid has come to nothing and now #{bot_team} have posession...".colorize(:red)
            sleep(2)
        end
        # This is the progress bar informing the user that the next phase of play is about to begin
        35.times do
            sleep(0.04)
            phase_bar.advance
        end
        phase_bar.reset
        system "clear"
        puts "Your defence is under-pressure!".colorize(:red)
        sleep(2)
        # This is the second defensive phase of play if the toss was won
        defend_choice_2 = team_defend_2(prompt,game,user_team,bot_team)
        if defend_choice_2 != user_team.defend_2
            bot_team.score += 1
            puts ascii.asciify("GOAL for").colorize(:red)
            puts ascii_slant.asciify("#{bot_team}").colorize(:red)
            sleep(1.5)
            puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
            sleep(1.5)
        else
            puts "You have executed a perfectly timed tackle and regained posession. Well done!".colorize(:green)
            sleep(2)
        end
        # This is the progress bar informing the user that the next phase of play is about to begin
        35.times do
            sleep(0.04)
            phase_bar.advance
        end
        phase_bar.reset
        system "clear"
        puts "Your team is has time for one final attack!".colorize(:green)
        sleep(2)
        # This is the third and final attacking phase of play if the toss was won
        attack_choice_3 = team_attack_3(prompt,game,user_team,bot_team)
        if attack_choice_3 == user_team.attack_3
            user_team.score += 1
            puts ascii.asciify("GOAL").colorize(:green)
            sleep(2.5)
        else
            puts "Your attacking raid has come to nothing and the referee has blown for full time."
            sleep(2.5)
        end
    # This is invoked when the user team loses the coin toss
    else
        puts ascii.asciify("You lost the toss.").colorize(:red)
        sleep(1.5)
        puts ascii.asciify("#{bot_team}").colorize(:red)
        puts ascii.asciify("to kick off").colorize(:red)
        # This is the progress bar informing the user that the game is about to kick off
        35.times do
            sleep(0.03)
            kickoff_bar.advance
        end
        system "clear"
        puts ascii_slant.asciify("PEEP!!!").colorize(:blue)
        sleep(0.4)
        puts "The referee blows the whistle to start the game. Your opponents are keeping posession of the ball well!".colorize(:red)
        sleep(2)
        system "clear"
        puts "Prepare to defend!".colorize(:red)
        # This is the first defensive phase of play if the toss was lost
        defend_choice_1 = team_defend_1(prompt,game,user_team,bot_team)
        if defend_choice_1 != user_team.defend_1
            bot_team.score += 1
            puts ascii_slant.asciify("GOAL for").colorize(:red)
            puts ascii_slant.asciify("#{bot_team}").colorize(:red)
            sleep(1.5)
            puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
            sleep(1.5)
        else                
            puts "You have executed a perfectly timed tackle and regained posession. Well done!".colorize(:green)
            sleep(2)
        end
        # This is the progress bar informing the user that the next phase of play is about to begin
        35.times do
                sleep(0.04)
                phase_bar.advance
            end
        phase_bar.reset
        system "clear"
        puts "You are keeping posession in the midfield. Each pass finds a team=mate perfectly".colorize(:green)
        sleep(2)
        # This is the first attacking phase of play if the toss was lost
        attack_choice_1 = team_attack_1(prompt,game,user_team)
        if attack_choice_1 == user_team.attack_1
            user_team.score += 1
            puts ascii.asciify("GOAL").colorize(:green)
            sleep(1.5)
            puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
            sleep(1.5)
        else
            puts "You have given away position to the opposition...".colorize(:red)
            sleep(2)
        end
        # This is the progress bar informing the user that the next phase of play is about to begin
        35.times do
            sleep(0.04)
            phase_bar.advance
        end
        phase_bar.reset
        system "clear"
        puts "Your defence is under-pressure!".colorize(:red)
        sleep(2)
        # This is the second defensive phase of play if the toss was lost
        defend_choice_2 = team_defend_2(prompt,game,user_team,bot_team)
        if defend_choice_2 != user_team.defend_2
            bot_team.score += 1
            puts ascii_slant.asciify("GOAL for").colorize(:red)
            puts ascii_slant.asciify("#{bot_team}").colorize(:red)
            sleep(1.5)
            puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
            sleep(1.5)
        else
            puts "You have executed a perfectly timed tackle and regained posession. Well done!".colorize(:green)
            sleep(2)
        end
        # This is the progress bar informing the user that the next phase of play is about to begin
        35.times do
            sleep(0.04)
            phase_bar.advance
        end
        phase_bar.reset
        system "clear"
            puts "Your team is now again on the attack!".colorize(:green)
        sleep(2)
        # This is the second attacking phase of play if the toss was lost
        attack_choice_2 = team_attack_2(prompt,game,user_team,bot_team)
        if attack_choice_2 == user_team.attack_2
            user_team.score += 1
            puts ascii.asciify("GOAL").colorize(:green)
            sleep(1.5)
            puts "Score #{user_team}: #{user_team.score} - #{bot_team.score} :#{bot_team}"
            sleep(1.5)
        else
            puts "Your attacking raid has come to nothing and now #{bot_team} have posession...".colorize(:red)
            sleep(2)
        end
        35.times do
        sleep(0.04)
            phase_bar.advance
        end
        phase_bar.reset
        system "clear"
        puts "Your opponent is launching one last counter-attack!".colorize(:red)
        # This is the third and final defensive phase of play if the toss was lost
        defend_choice_3 = team_defend_3(prompt,game,user_team,bot_team)
        if defend_choice_3 != user_team.defend_3
            bot_team.score += 1
            puts ascii_slant.asciify("GOAL for").colorize(:red)
            puts ascii_slant.asciify("#{bot_team}").colorize(:red)
            sleep(2.5)
        else
            puts "You have executed a perfectly timed tackle and regained posession. Well done!...".colorize(:green)
            sleep(2.5)
        end
    end

    system "clear"

    # This is the progress bar informing the user that the result is being calculated
    35.times do
        sleep(0.05)
        results_bar.advance
    end

    system "clear"

    # This is the loop that returns a winner or begins extra time
    while user_team.score == bot_team.score
        puts "The scores are as follows..."
        sleep(1.5)
        puts "#{user_team}: #{user_team.score}"
        sleep(1.5)
        puts "#{bot_team}: #{bot_team.score}"
        sleep(1.5)
        puts "The scores are level..."
        sleep(1.5)
        system "clear"
        puts ascii_slant.asciify("Extra-Time!!!")
        sleep(2)
        puts "The referee decides that #{user_team} have been the better behaved team and awards you the kick-off!".colorize(:blue)
        sleep(1.5)
        puts "PEEP! The referee's whistle blows and your team is immediately on the attack".colorize(:green)
        extra_time_choice = team_extra_time(prompt,game,user_team,bot_team)
        # This is returns an extra-time result from the user input
        if extra_time_choice == user_team.extra
            user_team.score += 1
            puts ascii.asciify("GOAL!!!").colorize(:green)
            sleep(1.5)
            puts ascii.asciify("#{user_team}").colorize(:green)
            puts ascii.asciify("HAVE SCORED").colorize(:green)
            sleep(2)
        else
            system "clear"
            bot_team.score += 1
            puts "The goalkeeper saves!".colorize(:red)
            sleep(1.5)
            puts "He spots his striker unmarked upfield and boots the ball towards him."
            sleep(1)
            puts "The opposition striker controls the ball...."
            sleep(1.5)
            puts "He spots your goalkeeper off his line and takes a long-range snapshot..."
            sleep(2)
            puts ascii_slant.asciify("GOAL!").colorize(:red)
            sleep(2)
            puts ascii_slant.asciify("#{bot_team}").colorize(:red)
            puts ascii_slant.asciify("Have scored...").colorize(:red)
            sleep(2)
        end
    end

    # This returns the result if the bot team wins
    if user_team.score < bot_team.score
            puts "#{user_team}: #{user_team.score}"
            sleep(1.5)
            puts "#{bot_team}: #{bot_team.score}"
            sleep(1.5)
            puts ascii_slant.asciify("#{bot_team}").colorize(:red)
            puts ascii_slant.asciify("are the winners!").colorize(:red)
            sleep(3)
            puts "Better luck next time"
            sleep(3)
    # This returns the result if the user team wins
    else
        puts "#{user_team}: #{user_team.score}"
        sleep(2)
        puts "#{bot_team}: #{bot_team.score}"
        sleep(2)
        puts ascii_slant.asciify("#{user_team}").colorize(:green)
        puts ascii_slant.asciify("are the winners!").colorize(:green)
        sleep(2)
        puts "Congratulations"
        sleep(3)
    end
    sleep(2)
    system "clear"
    user_team.score = 0
    bot_team.score = 0
    print "Press the 'enter key' to return to the main menu: "
    gets
end


system "clear"
# This is the main greeting on the splash page
puts ascii.asciify("Welcome")
sleep(0.5)
puts ascii_slant.asciify("#{player_name}...")
sleep(1)
puts sw_font.write("  to")
puts ascii.asciify("Football Shootout").colorize(:green)
sleep(1.5)
puts ascii_slant.asciify("a 5-a-side Sim").colorize(:red)
sleep(1.5)

# This is the while loop for the main menu
# A case with options is contained within
option =""
while option != "4"
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
            puts ascii_slant.asciify("Your Team of Legends").colorize(:green)
            puts user_team.all_team_info
            print "Press any key to continue and select your opponent..."
            gets
            system "clear"
            bot_team = team_select_bot(prompt,game)
            system "clear"
            puts ascii_slant.asciify("Your Opponent").colorize(:red)
            puts bot_team.all_team_info
            print "Press any key to continue to the coin toss..."
            gets
            system "clear"
            toss = coin_toss(prompt,game)
            system "clear"
            main_game(prompt,game,toss,user_team,bot_team,coin_bar,ascii,kickoff_bar,ascii_slant,phase_bar,results_bar)
        when "4"
            next
        else
            puts "Invalid option".colorize(:red)
            sleep(1)
            puts "Please select 1, 2, 3 or 4!"
            sleep(1)
            15.times do
            sleep(0.05)
            bar.advance  # by default increases by 1
            end
            system "clear"
    end
end
puts "Thank you for playing Football Shootout"

        

        

# puts game.print_teams