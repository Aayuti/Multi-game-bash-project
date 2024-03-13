#!/bin/bash

# Function to display the game selection menu
choose_game() {
    # Using zenity to present a list of games to choose from
    game=$(zenity --list --column="Game" "Hangman" "Snake" "Tic-Tac-Toe" "Quiz" --title="Choose a Game" --text="Select a game to play" --width=300 --height=200)
}

# Function to display the menu for the selected game
game_menu() {
    # Running the appropriate script based on the selected game
    case "$1" in
        "Hangman") ./Hangman.sh ;;      # Executing Hangman game
        "Snake") ./snake.sh ;;           # Executing Snake game
        "Tic-Tac-Toe") ./tic-tac-toe.sh ;;  # Executing Tic-Tac-Toe game
        "Quiz") ./quiz.sh ;;             # Executing Quiz game
    esac
}

# Main script
choose_game  # Calling the function to display game selection menu

# Checking if a game has been selected
if [ -n "$game" ]; then
    game_menu "$game"   # If a game is selected, call the function to display the menu for the selected game
else
    zenity --info --text="No game selected. Exiting."  # If no game is selected, display an information dialog and exit
fi
