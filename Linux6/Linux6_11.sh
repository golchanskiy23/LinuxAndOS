#! /bin/bash

read -p "Enter even number: " number
if [[ $((number % 2)) -eq 1 ]]; then
	echo "Input error, not even: $(date)">&2 >> errorlog.txt
	exit 1
fi

curr=$((2*($number)-1))

for ((i=0; i<number; i++ )); do
	spaces=$i
	if ((i == 0)); then
		for ((j=0; j < number; j++)); do
			printf "* "
		done
	else
	printf "%*s" "$spaces" ""
	for ((j=$spaces; j <= $curr-$spaces; j++)); do
		if (( j == $spaces || j == $curr-$spaces-1)); then
			printf "*"
		else
			printf " "
		fi
	done
	printf "%*s" "$spaces" ""
	fi
	echo
done

for (( i=number-2; i>=0 ; i-- )); do
        spaces=$i
        if ((i == 0)); then
                for ((j=0; j < number; j++)); do
                        printf "* "
                done
        else
        printf "%*s" "$spaces" ""
        for ((j=$spaces; j <= $curr-$spaces; j++)); do
                if (( j == $spaces || j == $curr-$spaces-1)); then
                        printf "*"
                else
                        printf " "
                fi
        done
        printf "%*s" "$spaces" ""
        fi
        echo

done
