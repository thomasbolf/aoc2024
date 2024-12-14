BEGIN{
FS="[=, ]+"
width=101
height=103
arr[1]=0; arr[2]=0; arr[3] = 0; arr[4]=0;
	}

function calculate_safety(xpos,ypos,xvel,yvel,time,arr)
{
	newXpos=((xpos+time*xvel)%width) 
	newYpos=((ypos+time*yvel)%height)
        if(newXpos < 0){
                newXpos += width
        }
        if(newYpos < 0){
                newYpos += height
        }
	print time	
        if (newXpos == int(width / 2) || newYpos  == int(height / 2)) {
                on_center++
        }
        else if (newXpos < width / 2 && newYpos < height / 2) {
	       	res[1,time] += 1
        }
        else if (newXpos > width / 2 && newYpos < height / 2) {
                res[2,time] += 1
        }
        else if (newXpos < width / 2 && newYpos > height / 2) {
                res[3,time]++
        }
        else if (newXpos > width / 2 && newYpos > height / 2) {
                res[4,time]++
        }
	
	
}


{	
	for(t=2; t <= 20000; t++)		
		calculate_safety($2+0,$3+0,$5+0,$6+0,t,res)
}
END{
	for(t = 2; t <= 20000; t++){
	    #couldn't explain why this works
	     if(res[1,t]*res[2,t]*res[3,t]*res[4,t] <= 70000000){
	    	print "T: " t
	    	print "RES: " res[1,t] * res[2,t] * res[3,t] * res[4,t]
	     }	
	}
    }
