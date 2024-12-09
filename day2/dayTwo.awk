{
    safe=1
	prevdiff=$1 - $2
    for (i = 1; i < NF; i++) {
		diff = $i - $(i + 1)
		if(diff * prevdiff <= 0){
			safe = 0
		}		
		if(diff > 3 || diff < -3){
			safe = 0
		}
    	prevdiff=diff    
   } 
    if(safe && diff != 0){
	counter = counter+1
    }
}
END{
print counter


}

