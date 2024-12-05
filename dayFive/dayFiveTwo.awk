function compareRule(i1, v1, i2, v2){
    rule = v1 "|" v2; 
    reverse_rule = v2 "|" v1;  
    for (ele in ruleSet) {
        if (ruleSet[ele] == rule) {
			return -1; 
        }
        if (ruleSet[ele] == reverse_rule) {
            return 1; 
        }
    }	
}
rules==0{
    if(split($0, arr, "|")){ruleSet[NR] = arr[1] "|" arr[2]; rulesLeft[NR] = arr[1]; rulesRight[NR] = arr[2]}
    else{rules=1}
}rules!=0{
	count=0
	for(i = 1; i < length(rulesLeft); i++){count += int(index($0, rulesLeft[i]) < index($0, rulesRight[i]) || index($0, rulesLeft[i]) == 0 || index($0, rulesRight[i]) == 0);}
        if(count+1==length(rulesLeft)){
            split($0, numbers, ",")
            A += numbers[int((length(numbers)+1)/2)]
        }
		else{
    	delete toSort	
		split($0, data, ",")
    		asort(data, result, "compareRule")
    		B += result[int((length(result)+1)/2)]
		}
}END{print "A is" A; print "B is " B;}

