BEGIN{
FS="[=, ]+"
width=101
height=103
arr[1]=0; arr[2]=0; arr[3] = 0; arr[4]=0;
	}

function calculate_safety(xpos,ypos,xvel,yvel,time,arr)
{
	newXpos=((xpos+100*xvel)%width) 
	newYpos=((ypos+100*yvel)%height)
        if(newXpos < 0){
                newXpos += width
        }
        if(newYpos < 0){
                newYpos += height
        }
	
        if (newXpos == int(width / 2) || newYpos  == int(height / 2)) {
                on_center++
        }
        # Check quadrants
        else if (newXpos < width / 2 && newYpos < height / 2) {
	       	arr[1] += 1
        }
        else if (newXpos > width / 2 && newYpos < height / 2) {
                arr[2] += 1
        }
        else if (newXpos < width / 2 && newYpos > height / 2) {
                arr[3]++
        }
        else if (newXpos > width / 2 && newYpos > height / 2) {
                arr[4]++
        }
	
	
}


{	
	calculate_safety($2+0,$3+0,$5+0,$6+0,100,arr)
}
END{
	print arr[1] " " arr[2] " " arr[3] " " arr[4]
	print(arr[1] * arr[2] * arr[3] * arr[4])
	}
