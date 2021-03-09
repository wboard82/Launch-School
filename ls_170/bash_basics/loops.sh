counter=0
max=10

while [ $counter -lt $max ]
do
    echo $counter
    ((counter++))
done


greeting () {
    echo "Hello $1"
    echo "Hello $2"
}

greeting 'Ellie' 'Max'

