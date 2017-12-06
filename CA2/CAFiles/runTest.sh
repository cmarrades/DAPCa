
#$1 : number of users load test is simulating
#$2 time in seconds the script will be running


# "&" character is used to run the process in background


testSeconds=5

#create file with csv headers..
echo "CO,N,idle">results.dat


for i in {1..30}
do
	echo Running load test script for $i users, $testSeconds seconds
	./loadtest $i &

	#read idle from mpstat json...
	idle=$(mpstat -o JSON $testSeconds 1 | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle') 

	sleep $testSeconds

	pkill loadtest
	# read number of transactions (lines)
	transactions=$(wc -l < ./synthetic.dat)

	echo "$i users, $transactions transactions,  $idle idle"
	#append test results to file...
	echo "$transactions,$i,$idle">>results.dat

done

echo "finished running test"
