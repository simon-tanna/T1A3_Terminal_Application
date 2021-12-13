# This is the README file for the terminal application assessment.

## The first step that I am taking is making a Github repo

## Here is the link to the Trello Board if needed
### [My Trello Board](https://trello.com/b/5awSV5j8/t1a3-terminal-application)

# Football Shootout! - A five-a-side soccer sim
## Software Development Plan
### Purpose and Scope
#### Overview
This application is a simple yet fun game designed to simulate a real match experience for the user. The user is able to view the rules of the game and view the team details before entering the match menu.
The user is able to select a team that they will control and select the team controlled by the application before participating in a coin toss to determine who will kick-off. There are 5 phases of play in the match where the user can choose a team action which results in a goal or a turn-over of posession. If the scores are even after the 5 phases of play, the match enters extra-time whereby the user has one last chance to secure victory! This match experience can be repeated as many times as the user wants.

#### Target Audience
Football Shootout is aimed to provide entertainment for anyone who needs to waste some time and is appropriate for all age groups. The user does not need to have any knowledge of the rules of football to play as the rules are available in the main menu.

#### How to use the app
Insert info here

### Features of Football Shootout
#### The Coin-Toss
In order to determine which team kicks off and gains the advantage of an extra attack, a simple coin toss function has been built into the app.
Each team in the Teams class features a coin toss variable which is populated with a random selection of either "heads" or "tails" (code below).

    team_1_toss = ["heads", "tails"].sample
    team_2_toss = ["heads", "tails"].sample
    team_3_toss = ["heads", "tails"].sample
    team_4_toss = ["heads", "tails"].sample

After a user selects their team and proceeds to the coin toss part of the game, the selection they make will return a true or false answer matched against the randomly assigned coin toss variable of their team. Depending whether the answer is true or false, an 'if-else' loop determines if the user team will have posession of the ball or defend (code below).

    if toss == user_team.toss
        puts "You have won the toss... Prepare to kick off!"
    ..
    ..
    ..
    else
        puts "You lost the toss. #{bot_team} to kick off"
    ..
    end

Ruby gem TTY-prompt was used to present the user with the "heads" or "tails" choice so no error handling was required in this case.

#### The Team Information Menu
In order for the user to know what players they will have on their team and what football superstars they will potentially be facing, a simple team information menu option has been included as part of the main game menu.
In order to build the array of 5 players within the Player class, the Ruby gem "faker" was used to ensure a unique user experience with every launch of the application.
