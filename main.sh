#!/bin/bash

main_menu() {
    selection=$(zenity --list --title="Main Menu" --column="Select" \
        "Hangman" "Tic Tac Toe" "Snake" "Quiz" "Exit")

    case "$selection" in
        "Hangman") hangman_menu;;
        "Tic Tac Toe") tic_tac_toe_menu;;
        "Snake") snake_menu;;
        "Quiz") quiz_menu;;
        "Exit") exit;;
    esac
}

hangman_menu() {
    choose=$(zenity --list --title="Hangman Menu" --column="Select" \
        "Play Hangman" "Back to Main Menu")

    case $choose in
        "Play Hangman") ./Hangman.sh;;
        # "Choose a topic") ./hangman_choose_topic.sh;;
        "Back to Main Menu") main_menu;;
    esac
}

tic_tac_toe_menu() {
    choose=$(zenity --list --title="Tic Tac Toe Menu" --column="Select" \
        "Play Tic Tac Toe" "Back to Main Menu")

    case $choose in
        "Play Tic Tac Toe") ./tic-tac-toe.sh;;
        "Back to Main Menu") main_menu;;
    esac
}

snake_menu() {
    choose=$(zenity --list --title="Snake Menu" --column="Select" \
        "Play Snake" "Back to Main Menu")

    case $choose in
        "Play Snake") ./snake.sh;;
        "Back to Main Menu") main_menu;;
    esac
}

quiz_menu() {
    choose=$(zenity --list --title="Quiz Menu" --column="Select" \
        "Play Quiz" "Back to Main Menu")

    case $choose in
        "Play Quiz") ./quiz.sh;;
        "Back to Main Menu") main_menu;;
    esac
}

# Initial call to the main menu
main_menu