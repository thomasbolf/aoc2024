{
	while ($0){
		sub(/.[^md]*/,z)
    	/^do\(\)/&&n=0;
    	/^don't\(\)/&&n=1;
		if(match($0, /^mul\(([0-9]{1,3}), *([0-9]{1,3})\)/, matches)){
    		product = (matches[1]+0) * (matches[2]+0);
        	total += product*!n;
    	}
}
}
END{
	print total;
}
