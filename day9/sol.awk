BEGIN{}

{
	##make str
	counter=0
	end=0
	for(i=1; i<=length($0); i++){
		if(i%2!=0){
			for(j=1;j<=substr($0,i,1)+0; j++){
				res[++end]=counter
			}
			counter++
		}
		else{
			for(j=1; j<= substr($0,i,1)+0;j++){
				res[++end]="."
			}
		}
	}
	prevJ=length(res)
	for(i=1; i <= length(res); i++){
		if(res[i]=="."){
			for(j=prevJ;j>i;j--){
				if(res[j] ~ /^[0-9]/){
					res[i]=res[j]
					res[j]="."
					prevJ=j
					break
				}
			}
		}
	}
	
	checkSum=0
	for(i=1; i <=length(res); i++){
		if(res[i] ~ /^[0-9]/){
			checkSum += res[i] *(i-1)
		}
		else{
			break
		}
	}
	print checkSum
	exit
}
