all: make_README.md

make_README.md:
	printf "# Coursera - The Unix Workbench\n" > README.md
	printf "## Peer-graded Assignment: Bash, Make, Git, and GitHub\n\n" >> README.md
	printf "1. Make executed (Local) at: $$(date --rfc-3339=seconds)\n" >> README.md
	printf "2. Make executed (UTC) at: $$(date -u --rfc-3339=seconds)\n" >> README.md
	printf "3. Number of lines in guessinggame.sh is: $$(wc -l <guessinggame.sh)" >> README.md
