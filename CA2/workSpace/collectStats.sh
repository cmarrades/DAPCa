
#$1 : number of users load test is simulating
#$2 time in seconds the script will be running

#echo $1
#echo $2

# "&" character is used to run the process in background

echo Running load test script for $1 users, $2 seconds
./loadtest $1 &

sleep $2

#pkill loadtest

#read number of transactions (lines)
transactions=$(wc -l ./synthetic.dat)
echo $lineCount
echo done 

