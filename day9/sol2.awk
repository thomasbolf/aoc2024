BEGIN{}

{
	##make str
	counter=0
	end=0
	
	for(i=1; i<=length($0); i++){
		if(i%2!=0){
			for(j=1;j<=substr($0,i,1)+0; j++){
				res[++end]=counter
				counterCount[counter]+=1
				startIdx[counter]=end
			}
			counter++
		}
		else{
			for(j=1; j<= substr($0,i,1)+0;j++){
				res[++end]="."
			}
		}
	}
	print "no loop here"
	lastJ=length(res)
	
	for(i=counter-1; i >= 0; i--){
		print "COUNTER: " i
		dotCount=0
		if(lastJ < 1){
			break
		}
		for(j=1; j <= lastJ; j++){
			if(res[j]=="."){
				dotCount++
				if(dotCount>=counterCount[i] && dotCount > 0 && startIdx[i] > j){
					lastJ=startIdx[i]
					while(res[lastJ]==i && lastJ > 0){
						res[lastJ]="."
						lastJ--
					}
				#	fhor(k=j-counterCount[i]+1; k <= j; k++){
						
				#		res[k]="$"
				#	}
					while(res[j] == "." && dotCount > 0){
						res[j-dotCount+1]=i
						dotCount -= 1
					}
					
					break
				}
			}else{dotCount=0}
		}
	}
	
	checkSum=0
	idx=0
	for(j=1;j<=100;j++){ printf " " res[j] " "}
	printf("\n CHECKSUM:")
	for (i=1; i <= length(res); i++) {
    		if ((res[i] "") ~ /^[0-9]+/) {
       			checkSum = checkSum + (res[i] *idx)
			idx++;
    		}
		if(res[i]"" == "."){
			idx++;
		}
	}
	print checkSum
	exit
}
