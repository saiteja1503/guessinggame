#!/bin/bash

function get_file_count {
    echo $(ls -1 | wc -l)
}

echo "Welcome to the guessing game!"
echo "Can you guess how many files are in the current directory?"

file_count=$(get_file_count)

while true; do
    read -p "Enter your guess: " guess

    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number."
        continue
    fi

    if [ "$guess" -lt "$file_count" ]; then
        echo "Too low. Try again."
    elif [ "$guess" -gt "$file_count" ]; then
        echo "Too high. Try again."
    else
        echo "Congratulations! You guessed right."
        break
    fi
done
