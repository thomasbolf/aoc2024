
BEGIN{
FS=""
	r=-1;
c=-1
rows=0
}

{	

	rows=rows+1
	for(i = 1; i <= NF; i++){
		q[rows, i] = "" $i;
		printf q[rows,i]
        	if (q[rows,i]== "^") {
			r = rows;
            		c = i;
        	}
	}
	print "WHAT" q[rows,i]
}
function display(qCopy, i, j){
    # printf "\033[H\033[J"; 

	for(i=1; i<=NR; i++){
		row=""
		for(j=1; j<=NF; j++)
			row=row qCopy[i,j]
		printf "%s\n", row;

	}

}
function detectLoop(qCopy,r,c, obr, obc){
	printf "\033[H\033[J";
	qCopy[obr,obc]="#"
	direction=1
	inRange=1
	printf "DETECTING  LOOP \n"
	while(inRange){
		if(++cache[r,c,direction,obr,obc]>1){return 1}
		if(r > NR || r < 1 || c > NF || c < 1){ return 0}
                if(direction==1){
                        qCopy[r,c]="X"
                        if(qCopy[r-1, c]=="#"){
                                direction=2
                        }
                        else{
                                r--

                        }
                        qCopy[r,c]="^"
                }
                else if(direction==2){
                        qCopy[r, c] = "X"
                        print "Editing"
                        if(qCopy[r,c+1] =="#"){
                                direction=3
                        }
                        else{c++;
                        }
                        qCopy[r,c] = ">"
                }
                else if(direction==3){
                        qCopy[r,c]="X"
                        if(qCopy[r+1,c]=="#"){
                                direction=4
                        }
                        else{r++;
                        }
                        qCopy[r,c]="V"
                }
                else if(direction==4){
                        qCopy[r,c]="X"
                        if(qCopy[r,c-1]=="#"){
                                direction=1 }
                        else{c--;
                        }
                        qCopy[r,c]="<"

                }
                #display(qCopy)				
	}
	print("DONE")
	qCopy[obr,obc]="."
	return 0
}
function copy(q, qCopy,i,j){
	for(i=1;  i <= NR; i++){
		for(j=1; j <= NF; j++){
			qCopy[i,j]=q[i,j]
		}
	}
}

END{
	ir=r
	ic=c
	for(i = 1; i <= NR;i++){
		for(j=1;j<=NF;j++){
			printf "IR " ir " ic " ic " q[i,j] " q[i,j] 
			if(!(ir == i && ic == j) && q[i,j] != "#"){
				printf "HELLOOO \nO "				
				row=ir
				col=ic
				printf "ABOUT TO DELETE"
				#delete qCopy
				printf "DELETED"
				copy(q,qCopy)
				printf "COPIED"
				res+=detectLoop(qCopy,row,col,i,j)
			}
		}
	}
	printf "\n" res "\n"
	copy(q,qCopy)


}
