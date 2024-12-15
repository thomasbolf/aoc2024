BEGIN{FS=""}


#LOAD GRID
/#./{

	print "HELLO"
	for(i=1;i<=NF;i++){
		if($i=="@"){
			guyRow=NR;
			guyCol=i
		}
		grid[NR,i]=$i;
	}
}
#we will modify the 1d of the 2d grid where he will be moving
#if direction is -1 he will be moving "left" else he will be moving "right"
function runStep(arr, len, charPos, direction,i,j){
	##pretty print arr
	printf "RUNNING STEP\n";
	printf "CHARPOS: " charPos "\n"; 
	for(i=1; i<=len; i++){
		printf arr[i];
	}
	printf "\n";
	
	if(arr[(charPos+0)+direction]=="#"){
		print "WALL IN THE WAY"
		return;
	}
	#if the character is walking into a ., then we move the character to the right
	if(arr[charPos+direction]=="."){
		print "MOVING TO A DOT"
		arr[charPos+direction]="@";
		arr[charPos]=".";
		return
	}
	#if the character is moving to a O, we see if there is a "dot" before a "#" in the direciton he is moving, if there is a ., shift into thee . 
	if(arr[charPos+direction]=="O"){
		print "O IS IN THE WAY"
		for(i =1; charPos + direction * i <= len; i++){
			if(arr[charPos+direction*i]=="#"){
				print "BREAKING!"
				break;
			}
			if(arr[charPos+direction*i]=="."){
				printf "FOUND A DOT!"
				for(j=i; j>1; j--){
					arr[charPos+direction*j]="O";
				arr[charPos+direction]="@";
				arr[charPos]=".";
				return;
			}

		}
	}



}
}
#display 2d grid
function displayGrid(grid,i,j){
	#mark it
	printf "DISPLAYING GRID\n";
	for(i=1; i<=NR; i++){
		for(j=1; j<=NF; j++){
			printf grid[i,j];
		}
		printf "\n";
	}
}
#RUN INSTRUCTIONS ON GRID
/^[\^>v<]/{
	print "GRID ROW: " counter++;
	for(i=1;i<=NF;i++){
		delete arr;
		if($i=="v"){
			print "STEP: " i "SHIFT DOWN";
			for(j=1; j<=NR; j++){
				arr[j]=grid[j,guyCol];
			}
			runStep(arr,NR+0,guyRow+0,1);
			for(j=1; j<=NR; j++){
				grid[j,guyCol]=arr[j];
				if(arr[j]=="@"){
					guyRow=j;
				}
			}
			displayGrid(grid);
		}
		else if($i=="^"){
			print "STEP: " i "SHIFT UP";
			for(j=1; j<=NR; j++){
				arr[j]=grid[j,guyCol];
			}
			runStep(arr,NR,guyRow,-1);
			for(j=1; j<=NR; j++){
				grid[j,guyCol]=arr[j];
				if(arr[j]=="@"){
					print "GUY ROW CHANGED"
					guyRow=j;
				}
			}
			displayGrid(grid);
		}
		else if($i==">"){
			print "STEP: " i "SHIFT RIGHT";
			for(j=1; j<=NF; j++){
				arr[j]=grid[guyRow,j];
			}
			runStep(arr,NF,guyCol+0,1);
			for(j=1; j<=NF; j++){
				grid[guyRow,j]=arr[j];
				if(arr[j]=="@"){
					guyCol=j;
				}
			}
			displayGrid(grid);
		}
		else if($i=="<"){
			print "STEP: " i "SHIFT LEFT";
			for(j=1; j<=NF; j++){
				arr[j]=grid[guyRow,j];
			}
			runStep(arr,NF,guyCol,-1);
			for(j=1; j<=NF; j++){
				grid[guyRow,j]=arr[j];
				if(arr[j]=="@"){
					guyCol=j;
				}
			}
			displayGrid(grid);
		}
	}
}


END{
##FIND ALL ROW AND COLUMN VALUES OF ALL "O" IN THE GRID, MULTIPLY THE ROW VALUE BY 100, ADD it to the column value. find the total sum
for(i=1; i<=NR; i++){
	for(j=1; j<=NF; j++){
		if(grid[i,j]=="O"){
			print "FOUND O"
			print "ROW: " i "COL: " j
			sum+=(i-1)*100+(j-1);
		}
	}
}
print sum; #PRINT RESULT
}
#PRINT RESULT

