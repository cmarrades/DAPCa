echo $1

#State -> (structure)

#    The current state of the instance.
#
#    Code -> (integer)
#
#        The low byte represents the state. The high byte is an opaque internal value and should be ignored.
#
#            0 : pending
#            16 : running
#            32 : shutting-down
#            48 : terminated
#            64 : stopping
#            80 : stopped

#'STATE	16'

awsInfo=`aws ec2 describe-instances --output text  --instance-ids $1`


#i-033390d4b2e4fb049`
#i-07bc96b8192810fe0

#echo awsInfo

echo "Info retrieved. Processing..."

#echo $awsInfo

isRunning=`grep "running" <<< $awsInfo | wc -l`

echo $isRunning

if [ $isRunning -eq 1 ]; then

  echo "The CPU $1 is Running"
else
  echo "The CPU $1 is not Running"

fi

