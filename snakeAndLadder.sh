#!/bin/bash -x

# Problem Statement -> Snake And Ladder
# Author -> Pushkar Morey
# Date -> 22/03/2020

#CONSTANTS
StartPosition=0
endPosition=100

#VARIABLES
playerPosition=0


diceResult=$((RANDOM%6+1))
echo $diceResult

choice=$((RANDOM%3))
case $choice in
			0)
				#NO PLAY CONDITION
				playerPosition=$(($playerPosition))
				echo "NO PLAY CONDITION.."  ;;

			1)
				#SNAKE
				playerPosition=$(($diceResult-$playerPosition))
				echo "GOT SNAKE.."  ;;

			*)
				#LADDER
				playerPosition=$(($diceResult+$playerPosition))
				echo "GOT LADDER.."
esac

echo "Position of player is:: $playerPosition"
