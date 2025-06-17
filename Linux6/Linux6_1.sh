#! /bin/bash

read -p "Enter odd number: " number
if [[ $((number % 2)) -eq 0 ]]; then
	echo "Input error, not odd: $(date)">&2 >> errorlog.txt
	exit 1
fi

half=$((($number+1)/2))

for ((i=0; i<=half; i++ )); do
	spaces=$(($half-$i))
	printf "%*s" "$spaces" ""

	for ((j=$spaces; j <= 2*($number-1)-$spaces; j+=2)); do
		printf "*"
		if (( j >= 2*($number-1)-$spaces )); then
			break
		else
			printf " "
		fi
	done
	printf "%*s" "$spaces" ""
	echo
done

for ((i=0; i<=half-1; i++ )); do
        spaces=$(($i+1))
        printf "%*s" "$spaces" ""

        for ((j=$spaces; j <= 2*($number-1)-$spaces; j+=2)); do
                printf "*"
                if (( j >= 2*($number-1)-$spaces )); then
                        break
                else
                        printf " "
                fi
        done
        printf "%*s" "$spaces" ""
        echo
done
