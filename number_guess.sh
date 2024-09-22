#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=gamedb -t --no-align -c"

#Welcome message

echo -e "\n~~~~ Number Guessing Game ~~~~\n"

#ask for username

echo "Enter your username:"
read USERNAME_INPUT

#Check for username in DB.
USERNAME_LOOKUP_RESULT=$($PSQL "select username from users where username='$USERNAME_INPUT'")

if [[ -z $USERNAME_LOOKUP_RESULT ]]
then
  #if no username is found in DB, display welcome new user message
  echo -e "\nWelcome, $USERNAME_INPUT! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "insert into users(username, games_played, best_game) values('$USERNAME_INPUT', 0, null)")
  USER_ID=$($PSQL "select user_id from users where username='$USERNAME_INPUT'")
else
  #look up game stats
  USER_ID=$($PSQL "select user_id from users where username='$USERNAME_INPUT'")
  USERNAME=$($PSQL "select username from users where user_id=$USER_ID")
  GAMES_PLAYED=$($PSQL "select games_played from users where user_id=$USER_ID")
  BEST_GAME=$($PSQL "select best_game from users where user_id=$USER_ID")
  #Welcome previous user and provide stats
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

#setup variables and ask the user to guess
NUMBER_OF_GUESSES=0
SECRET_NUMBER=$((1 + $RANDOM % 1000))
echo -e "\nGuess the secret number between 1 and 1000:"
read USER_GUESS

#while loop to keep getting a user input until they've guess the right thing.
USER_GUESSED_RIGHT="false"
while [[ $USER_GUESSED_RIGHT == "false" ]]
do
  #Check to see if the input is an integer
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    ((NUMBER_OF_GUESSES++))
    echo "That is not an integer, guess again:"
    read USER_GUESS

  #Check to see if the user guessed correctly
  elif [[ $USER_GUESS == $SECRET_NUMBER ]]
  then
    ((NUMBER_OF_GUESSES++))
    USER_GUESSED_RIGHT="true"
    
    #update database
    UPDATE_GAMES_PLAYED=$($PSQL "update users set games_played= games_played + 1 where user_id=$USER_ID")
    
    #check to see if this was their best round - Check for entry in database first.
    SELECT_BEST_GAME=$($PSQL "select best_game from users where user_id=$USER_ID")
    
    if [[ -z $SELECT_BEST_GAME ]]
    then
      #if best_game is null then insert current game as best game.
      INSERT_BEST_GAME=$($PSQL "update users set best_game = $NUMBER_OF_GUESSES where user_id=$USER_ID")
    else
      #if best_game gota value then check if it's higher than the current game's number of guesses
      if [[ $NUMBER_OF_GUESSES < $BEST_GAME ]]
      then
        UPDATE_BEST_GAME=$($PSQL "update users set best_game = $NUMBER_OF_GUESSES where user_id=$USER_ID")
      fi
    fi

    #exit the script
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    exit

  #Check to see if the guess is lower than the number
  elif [[ $USER_GUESS < $SECRET_NUMBER ]]
  then
    ((NUMBER_OF_GUESSES++))
    echo -e "\nIt's higher than that, guess again:"
    read USER_GUESS

  #Check to see if the guess is higher than the number
  elif [[ $USER_GUESS > $SECRET_NUMBER ]]
  then
    ((NUMBER_OF_GUESSES++))
    echo -e "\nIt's lower than that, guess again:"
    read USER_GUESS
  fi
done
