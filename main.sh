#! /bin/bash

function menu() {
    # exec 2> /dev/null
    selection=$(zenity --list "Choose a game" "Exit" --column="" --text="Choose an option" --title="Game options" --cancel-label="Quit")
    case "$selection" in
        "Choose a game") choice;;
        "Exit") exit;;

    esac
    echo
}

function choice() {
    choose=$(zenity --list "Hangman Game" "Tic-Tac-Toe" "Snake Eater" --column="" --text="Choose a game" --title="Game options" --cancel-label="Back")

    case "$choose" in
        "Hangman Game") filename="Hangman.sh";;
        "Tic-Tac-Toe") filename="tic-tac-toe.sh";;
        "Snake Eater") filename="snake.sh";;

    esac
}

function init() {
    clear
    filename="Hangman.sh"

    echo
    menu
}

init



