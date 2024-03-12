#!/bin/bash

# Function to display the game selection menu
choose_game() {
    game=$(zenity --list --column="Game" "Hangman" "Snake" "Tic-Tac-Toe" --title="Choose a Game" --text="Select a game to play" --width=300 --height=200)
}

# Function to display the menu for the selected game
game_menu() {
    case "$1" in
        "Hangman") ./Hangman.sh ;;
        "Snake") ./snake.sh ;;
        "Tic-Tac-Toe") ./tic-tac-toe.sh ;;
    esac
}

# Main script
choose_game

if [ -n "$game" ]; then
    game_menu "$game"
else
    zenity --info --text="No game selected. Exiting."
fi