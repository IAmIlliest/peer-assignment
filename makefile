all: make_README.md

make_README.md:
	printf "#Peer-graded Assignment: Bash, Make, Git, and GitHub\n" > README.md
	printf "1. Make executed at: $$(date --rfc-3339=seconds)\n" >> README.md
	printf "2. Number of lines in guessinggame.sh is: $$(wc -l <guessinggame.sh)" >> README.md
