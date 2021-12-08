# Notes on development of app

## App Structure

### Simple Football Game
The app will open with a welcome screen. 5-a-side shootout!
Ask for user name.
User will input name
User will be asked to select 1 of 2 teams as their team.
User will be asked to select 4 team members (to be confirmed as complexity may be too much for time frame)
Team of user to face off against AI team.
Coin toss - User to be asked head or tails?
If win toss. User has possession first.
The there will be 5 phases of play.
    - User team will have ball in a position. User asked to shoot or pass.
        - Outcome will be random as either goal or loss of possession.
        - If goal, +1 to user team score
        - If loss of possession, AI team gets ball and user to now defend.
    - AI team will have ball.
        - User asked to slide tackle or block tackle.
        - Outcome random of goal or regain possession
        - If goal +1 to AI team
At end of 5 phases of play, score and winner declared...
If scores are equal. Penalty awarded to user team.
- User asked to put ball left or right.
- Random outcome.
- If miss. Opponent breaks and scores to win match
End program

## Data Structure

We need
- Game
- Username
- Teams
- Players
- In-Game options
- Score

### Defining the data structure
App
- Displays welcome
    - Displays game message with game name
- Get username
    - Gets input from user so app knows what to call them'
- Selecting a team
    - Menu displays team selection option
    - Select and confirm team
    - AI Team is automatically selected
- Playing the match
    - The teams and player lineups are displayed
    - User calls heads/tails to choose team with possession
    - Gameplay option will display with user to choose one.
    - Result of gameplay option be returned to score
- Finishing the match
    - When turns are finished teams scores are printed to final score.
    - Winner is announced

## Classes
### Game
Attributes:
- Name
- Username
- Teams
- Players
- User_Options
- Score

Actions :
- Display welcome
- Ask username
- Select teams
- Add players
- Print game options
- Return a score

### Username
Attributes :
- username

Actions:
- adds username for user to use in game

### Teams
Attributes :
- Team Name
- Players
- Score

Actions: 
- Adds players to team
- Prints team details
- Holds team score

### Players
Attributes :
- Player Name
- Position

Actions :
- Gets player details for use in team class

### UserOptions
Attributes :
- Attacking
- Defending
- Shoot
- Pass
- Slide Tackle
- Block Tackle
- Goal
- No Goal
- Score

Actions :
- Displays gameplay options
- Gets user input for decision
- Gets score outcome

### Score
Attributes :
- User Score
- AI Team Score
- Total Score

Actions :
- Displays user and AI team score
- Returns total score
- Crowns champion of the game.