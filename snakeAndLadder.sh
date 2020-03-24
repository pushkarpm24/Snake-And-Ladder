#!/bin/bash -x

# Problem Statement -> Snake And Ladder
# Author -> Pushkar Morey
# Date -> 22/03/2020

#CONSTANTS
StartPosition=0
endPosition=100

#VARIABLES
player1Position=0
player2Position=0
dicePlayed=0

while [[ $player1Position -lt $endPosition && $player2Position -lt $endPosition ]]
do
throwDice1
throwDice2

function throwDice1()
{
	playerOneDice=$((RANDOM%6+1))
	chance=1
	playGame

	echo "Player 1 Position is..: $player1Position"
}

function throwDice2()
{
	playerTwoDice=$((RANDOM%6+1))
	chance=2
	playGame

	echo "Player 2 Position is..: $player2Position"
}


function playGame()
{

choice=$((RANDOM%3))

case $choice in
			0)
				#NO PLAY CONDITION
						if [[ $chance -eq 1 ]]
						then
								player1Position=$(($player1Position))
						else
								player2Position=$(($player2Position))
						fi
										  			;;

			1)
				#SNAKE

						if [[ $player1Position-$playerOneDice -lt 0 && $chance -eq 1 ]]
						then
								player1Position=0

						elif [[ $player1Position-$playerOneDice -ge 0 && $chance -eq 1 ]]
						then
								player1Position=$(($player1Position-$playerOneDice))
            		elif [[ $player2Position-$playerTwoDice -lt 0 && $chance -eq 2 ]]
            		then
                  		player2Position=0

            		elif [[ $player2Position-$playerTwoDice -ge 0 && $chance -eq 2 ]]
            		then
                  		player2Position=$(($player2Position-$playerTwoDice))
						fi

													;;

			*)
				#LADDER

						if [[ $player1Position+$playerOneDice -le 100 && $chance -eq 1 ]]
						then
								player1Position=$(($player1Position+$playerOneDice))

						elif [[ $player1Position+$playerOneDice -gt 100 && $chance -eq 1 ]]
						then
								player1Position=$(($player1Position))
            		elif [[ $player2Position+$playerTwoDice -le 100 && $chance -eq 2 ]]
            		then
                  		player2Position=$(($player2Position+$playerTwoDice))

            		elif [[ $player2Position+$playerTwoDice -gt 100 && $chance -eq 2 ]]
            		then
                  		player2Position=$(($player1Position))

						fi
													;;
esac

						if [[ $player1Position -eq 100 ]]
						then
								echo "Player One Get Won..."

						elif [[ $player2Position -eq 100 ]]
						then
								echo "Player Two Get Won..."

						fi
}

((dicePlayed++))

done
echo "Number of Dice Played Is..:$dicePlayed"
