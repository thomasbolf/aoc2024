
{
	target="XMAS"
	if(NR > 4){
		rows=4
	}
	else{
		rows=NR
	}
    cols = length($0)      # Number of columns
	if (NR >= 4){ # we now have 4 long, can check the top row	
		grid[4] = $0
		count = count + checkRow(1)+checkRow(4) + checkHoriz(1)+checkVert(1)+checkVert(4)
		grid[1] = ""
		grid[1] = grid[2]
    	grid[2] = grid[3]
    	grid[3] = grid[4]
	}
	else{
		grid[NR] = $0	
	}
}

END {
	count = count + checkHoriz(1) + checkHoriz(2) + checkHoriz(3)
	print count
}
function checkHoriz(row){
	countRow=0
	for(i = 1; i <= cols; i++){
		countRow += find_word(row, i, 0, 1)
		countRow += find_word(row, i, 0, -1)
	}
	return countRow
}
function checkVert(row){
    countVert=0
    for(i = 1; i <= cols; i++){
        countVert += find_word(row, i, 1, 0)
        countVert += find_word(row, i, -1, 0)
    }
    return countVert
}

function checkRow(row){
	countRow = 0
	for(i = 1; i <= cols; i++){
            countRow += find_word(row, i, 1, 1)  
            countRow += find_word(row,i , -1, -1)
            countRow += find_word(row, i, 1, -1)  
            countRow += find_word(row, i, -1, 1)  
	}
	
	return countRow

}
function find_word(x, y, dx, dy,   k, word) {
    word = ""
    for (k = 0; k < length(target); k++) {
        nx = x + k * dx
        ny = y + k * dy
        if (nx < 1 || nx > rows || ny < 1 || ny > cols) return 0
        word = word substr(grid[nx], ny, 1)
    }
    return (word == target) ? 1 : 0
}

