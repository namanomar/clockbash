#!/bin/bash

# Define color escape sequences
Red=$(tput setaf 1)
Green=$(tput setaf 2)
Yellow=$(tput setaf 3)
Blue=$(tput setaf 4)
Reset=$(tput sgr0)

# Function to handle script termination
cleanup() {
  tput cnorm  # Restore cursor visibility
  echo -e "${Reset}"
  exit
}

# Trap signals to ensure cleanup is called
trap cleanup SIGINT SIGTERM

# Hide cursor
tput civis

# Function to add spaces between characters
add_spaces() {
  echo "$1" | sed 's/./& /g'
}

# Main loop to display the time
while true
do 
  clear
  echo -e "${Blue}\n\n\n"  # Add extra newlines for spacing
  add_spaces "$(date +%T)" | figlet | boxes -d stone -p a2v1  # Add padding inside the border
  echo -e "\n\n\n${Reset}"  # Add extra newlines for spacing
  sleep 1
done
