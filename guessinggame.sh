#!/usr/bin/env bash

# Assumes that all things returned by 'ls -l' are condsidered to be 'files', including directories and links etc.
# Custom exit codes 3-5 (inclusive) used to try and indicate where an error originated from or bubbled up to.

response="___init___"
num_files=$(expr $(ls -l | wc -l) - 1)

function checkGtOrLt () {
	local result=""
	if [[ $1 -eq $num_files ]]; then let result="0"
	elif [[ $1 -gt $num_files ]]; then let result="1"
	elif [[ $1 -lt $num_files ]]; then let result="2"
	else let result="3"
	fi
	echo $result
}

while $([[ $response =~ [0-9]+ ]] || [[ $response -eq "___init___" ]])
do
	echo "Please provide your guess (as an integer) for how many files are in the current directory: "
	read response

	if [[ $response =~ [0-9]+ ]]; then
		if [[ $(checkGtOrLt $response) -eq 0 ]]; then
			echo "You guessed correctly, well done!"
			exit 0
		elif [[ $(checkGtOrLt $response) -eq 1 ]]; then
			echo "Your guess is higher than the number of files. Please guess again."
		elif [[ $(checkGtOrLt $response) -eq 2 ]]; then
			echo "Your guess is lower than the number of files. Please guess again."
		elif [[ $(checkGtOrLt $response) -eq 3 ]]; then
			echo "You provided an unquantifiable response, please provide an integer next time you play."
			exit 3
		else
			echo "Some other unhandled exception."
			exit 4
		fi
	fi
done

# Catch all error code for any weird cases.
exit 5
