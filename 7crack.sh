if [[ $# -eq 0 ]]; then
	#no args
	echo "no args given"
	exit
fi

filename="$1"
wordlist="$2"
threads=0
if [ -z "$3" ]; then
	threads=5
else
	threads="$3"
fi

listlen=$(wc -l "$wordlist" | awk '{print $1}')
echo "total words: $listlen"
wordsperthread=$((listlen / threads))
echo "threads: $threads"
echo "words per thread: $wordsperthread"

rm -rf ./pids
touch ./pids

i=0
startpos=0
while [ $i -lt $threads ]
do
	if [[ $i -eq $((threads - 1)) ]]; then
		endpos=$((startpos + wordsperthread - 1))
	else
		endpos=$((startpos + wordsperthread))
	fi
	echo "starting thread: $i ($startpos - $endpos)"
	./thread.sh "$filename" "$wordlist" "$startpos" "$endpos" &
	startpos=$((endpos + 1))
	((i++))
done
