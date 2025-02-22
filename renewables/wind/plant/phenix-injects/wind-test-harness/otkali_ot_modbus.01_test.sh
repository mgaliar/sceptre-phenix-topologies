#!/bin/bash 

# A command to verify that this feature has produced expected output
# maybe a curl command to check an elk index or something of that sort
# diff example_golden_output.txt example1_feature1.txt
# for now we just test that the attack was successful 

# first arg is the 'new' file, results of the test
# second arg is the name of the golden file to compare

# lets make sure the results exist, this may not apply to all cases
if [ ! -f $1 ]; then
	echo "TEST FAIL"
	exit 1
fi
	

# get number of WTGs affected
WRITES=$(cat $1 | grep -i 'True and True' | wc -l)
# ensure greater than 25
echo $WRITES
test $WRITES -gt 25

# if test returns 0 good, else fail
if [ $? -eq 0 ]; then
	echo "TEST PASS"
	exit 0
else # if grep returns err=0 then it DID find 'failed'
	echo "TEST FAIL"
	exit 1
fi

