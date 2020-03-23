#!/bin/bash -x

# Problem Statement -> Snake And Ladder
# Author -> Pushkar Morey
# Date -> 22/03/2020

#CONSTANTS
StartPosition=0
endPosition=100

#VARIABLES
playerPosition=0
dicePlayed=0

while [[ $playerPosition -lt $endPosition ]]
do
diceResult=$((RANDOM%6+1))
choice=$((RANDOM%3))
case $choice in
			0)
				#NO PLAY CONDITION
						playerPosition=$(($playerPosition))
							echo "position of player is..: $playerPosition"
							echo "NO PLAY CONDITION.."  ;;

			1)
				#SNAKE
						playerPosition=$(($playerPosition-$diceResult))
				if [[ $playerPosition -lt 0 ]]
				then
						playerPosition=0
							echo "Position of player is..:$playerPosition"
				fi
							echo "position of player is..:$playerPosition"
							echo "GOT SNAKE.."  ;;

			*)
				#LADDER

				if [[ $diceResult+$playerPosition -le 100 ]]
				then
						playerPosition=$(($playerPosition+$diceResult))
							echo "position of player is..: $playerPosition"
				elif [[ $diceResult+$playerPosition -gt 100 ]]
				then
						playerPosition=$(($playerPosition))
							echo "Position of player is:: $playerPosition"
				fi
							echo "GOT LADDER.." ;;
esac
((dicePlayed++))
done
echo "Number of times dice played is..:$dicePlayed"
