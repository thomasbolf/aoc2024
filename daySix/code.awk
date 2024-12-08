
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
function display(q){
     printf "\033[H\033[J"; 

	for(i=1; i<=NR; i++){
		row=""
		for(j=1; j<=NF; j++)
			row=row q[i,j]
		printf "%s\n", row;

	}
	system("sleep 0.0025")

}
function detectLoop(q,r,c){
	printf "\033[H\033[J";
	display(q)
	direction=1
	inRange=1
	while(inRange){
		if(r > NR || r < 1 || c > NF || c < 1){ break}
                if(direction==1){
                        q[r,c]="X"
                        if(q[r-1, c]=="#"){
                                direction=2
                        }
                        else{
                                r--

                        }
                        q[r,c]="^"
                }
                else if(direction==2){
                        q[r, c] = "X"
                        print "Editing"
                        if(q[r,c+1] =="#"){
                                direction=3
                        }
                        else{c++;
                        }
                        q[r,c] = ">"
                }
                else if(direction==3){
                        q[r,c]="X"
                        if(q[r+1,c]=="#"){
                                direction=4
                        }
                        else{r++;
                        }
                        q[r,c]="V"
                }
                else if(direction==4){
                        q[r,c]="X"
                        if(q[r,c-1]=="#"){
                                direction=1
                        }
                        else{c--;
                        }
                        q[r,c]="<"

                }


                display(q)

		

	}




}
END{
    printf "\033[H\033[J";
	
	display(q)
	direction=1##up
	inRange=1
	print "starting"
	system("sleep 0.5")
	while(inRange){
		if(r > NR || r < 1 || c > NF || c < 1){ break}
		if(direction==1){
			q[r,c]="X"
			if(q[r-1, c]=="#"){
				direction=2
			}
			else{
				r--

			}
			q[r,c]="^"
		}
		else if(direction==2){
			q[r, c] = "X"
			print "Editing"
			if(q[r,c+1] =="#"){
				direction=3
			}
			else{c++;
			}
		        q[r,c] = ">"		
		}
		else if(direction==3){
			q[r,c]="X"
			if(q[r+1,c]=="#"){
				direction=4
			}
			else{r++;
			}
			q[r,c]="V"
		}
		else if(direction==4){
			q[r,c]="X"
			if(q[r,c-1]=="#"){
				direction=1
			}
			else{c--;
			}
			q[r,c]="<"

		}
	
			
		display(q)
		
		#system("sleep 0.025")
	}
	counter=0
	for(i = 1; i <= NF+1; i++){
		for(j=1;j<= NR+1;j++){
		counter += q[i,j]=="X"
		}
        }
	printf counter
	system("sleep 10")
	printf "\033[H\033[J"  # Clear screen when done
	
}
