
{
	rows=3
	grid[NR]=$0
	if(NR >= 3){
		grid[3]=$0
		count=count+checkGrid(grid)
		grid[1]=grid[2]
		grid[2]=grid[3]
			
}
}
END{
print count
}
function checkGrid(grid){
		countX = 0
		for(i = 2; i <= length(); i++){
			if(substr(grid[2], i, 1) == "A"){
				topLeft = substr(grid[1], i-1, 1)
				topRight = substr(grid[1], i+1, 1)
				bottomLeft = substr(grid[3], i-1, 1)
				bottomRight = substr(grid[3], i+1, 1)
				if(((bottomLeft == "S" && topRight == "M") || (bottomLeft =="M" && topRight=="S"))&& ((bottomRight=="S" && topLeft=="M") || (bottomRight=="M" && topLeft=="S"))){
					countX += 1	
				}
			}
		}
	 
	return countX;

}
