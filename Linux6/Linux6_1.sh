#! /bin/bash

read -p "Enter odd number: " number
if [[ $((number % 2)) -eq 0 ]]; then
	echo "Input error, not odd: $(date)">&2 >> errorlog.txt
	exit 1
fi

number=$((2*($number-1)+1))

half=$((($number)/2))

for ((i=0; i<=half; i++ )); do
	spaces=$(($half-$i))
	printf "%*s" "$spaces" ""

	for ((j=$spaces; j <= $number-$spaces; j+=2)); do
		printf "*"
		if (( j >= $number-$spaces )); then
			break
		else
			printf " "
		fi
	done
	printf "%*s" "$spaces" ""
	echo
done

for (( i=half-1; i>=0 ; i-- )); do
        spaces=$(($half-$i))
        printf "%*s" "$spaces" ""

        for ((j=$spaces; j <= $number-$spaces; j+=2)); do
                printf "*"
                if (( j >= $number-$spaces )); then
                        break
                else
                        printf " "
                fi
        done
        printf "%*s" "$spaces" ""
        echo
done
