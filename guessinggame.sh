#!/usr/bin/env bash

response="___init___"
num_files=$(expr $(ls -l | wc -l) - 1)


while $([[ $response =~ [0-9]+ ]] || [[ $response -eq "___init___" ]])
do
	echo "Please provide your guess (as an integer) for how many files are in the current directory: "
	read response

	if [[ $response =~ [0-9]+ ]]; then
		if [[ $response -eq $num_files ]]; then
			echo "You guessed correctly, well done!"
			exit 0
		elif [[ $response -gt $num_files ]]; then
			echo "Your guess is higher than the number of files. Please guess again."
		elif [[ $response -lt $num_files ]]; then
			echo "Your guess is lower than the number of files. Please guess again."
		else
			echo "Some unhandled exception."
			exit 1
		fi
	fi
done

exit 1
