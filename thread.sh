filename=$1
wordlist=$2
startpos=$3
endpos=$4

words=($(tail -n +$startpos "$wordlist" | head -n $((endpos-startpos+1))))
echo "$$" >> ./pids
for word in "${words[@]}"
do
	echo "trying: $word"
	result=$(7z x -aoa "$filename" -p"$word" 2>&1)
	if [[ "$result" == *"Everything is Ok"* ]]; then
	        pidstokill=($(cat ./pids))
	        for pidtokill in "${pidstokill[@]}"
	        do
			if [ $pidtokill -ne $$ ]; then
		               kill -9 "$pidtokill"
			fi
	        done
	        echo "Password for archive is: $word"
		exit
	fi
done
echo "Finished at:$(date)"
