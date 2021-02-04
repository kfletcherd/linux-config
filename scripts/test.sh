#!/bin/bash
counter=0
end=20
sleeper=0
outputstr="Bla bla: "
pounds=''
dashes='--------------------'
while [ $counter -lt $end ]; do
	#printf '%s %s%s\r' "$outputstr" "$pounds" "$dashes"
	sleep $sleeper
	let counter=$counter+1
	pounds="${pounds}#"
	dashes=${dashes::-1}
done

echo
echo


counter=20
for (( l=0; l<=counter; ++l )); do
	printf -v castbar '%-*s%0*d' "$l" '' $((counter-l)) ''
	castbar=${castbar// /#}
	castbar=${castbar//0/-}
	printf '%*s%10s: [%.*s%s]' "$(( l % 2 ))" '' 'Casting' "$counter" "$castbar"
	(( l < counter )) && printf '\r' || printf '\n'
	sleep .2s
done
