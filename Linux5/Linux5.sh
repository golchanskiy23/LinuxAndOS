#! /bin/bash

function divide () {
	if [[ $2 =~ ^0+.?0+ ]]; then
	echo "Division by 0: $(date)">&2 >> errorlog.txt
	exit 1
	fi

	echo "scale=6; $1 / $2" | bc
}

# берём 2 операнда и оператор через shift и суммируем
# результат операции к сумме
function calculate () {
	case $3 in
		"+")
		echo "scale=6; $1 + $2" | bc
		;;
		"-")
		echo $(($1-$2))
		;;
		"x" | "X")
		echo $(($1*$2))
		;;
		"/")
		echo $(divide $1 $2)
		;;
		*)
		echo "Unknown operator: $(date)">&2 >> errorlog.txt
		exit 1
		;;
	esac
}

# проверка числа введенных аргументов
# если меньше двух или четное - выводим ошибку
if [ $# -le 2 ]  || [ $(($# % 2)) -eq 0 ]; then
echo "Incorrect amount of arguments: $(date)">&2 >> errorlog.txt
exit 1
fi
#{ echo "out text"; echo "err text">&2 > file1.txt; }

# перебираем в цикле все аргументы командной строки
# если чётная - число, нечётное - операция(c 0-ой итерации)
res=0
while [ $# -gt 0 ]; do
oper1=$1
shift 1
operator=$1
shift 1
oper2=$1
shift 1

if ! [[ $oper1 =~ ^-?[0-9][.[0-9]+|[0-9]*]$ \
&& $oper2 =~ ^-?[0-9][.[0-9]+|[0-9]*]$ ]]; then
echo "Operands must be digits: $(date)">&2 >> errorlog.txt
exit 1
fi

if ! [[ "$operator" =~ ^[\+\-/xX]$ ]]; then
echo "Operator must be between [-xX+/]: $(date)">&2 >> errorlog.txt
exit 1
fi

tmp=$(calculate $oper1 $oper2 $operator)
res="scale=6; $res + $tmp" | bc
done

# выводим ответ
echo "$res"
