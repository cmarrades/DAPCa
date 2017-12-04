
#$1 : number of users load test is simulating
#$2 time in seconds the script will be running

#echo $1
#echo $2

# "&" character is used to run the process in background

echo Running load test script for $1 users, $2 seconds
./loadtest $1 &

idle=$(mpstat -o JSON 1 1 | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle') 

sleep $2
echo "idle is $idle"

pkill loadtest

# read number of transactions (lines)
transactions=$(wc -l ./synthetic.dat)
echo $transactions
echo done 

