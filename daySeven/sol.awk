BEGIN{FS=":* "; n=0}
eval(3,$2){
	n+=$1
}
function eval(idx, val){
	return (val <= $1) && ( (idx==NF+1 && val==$1) ||( (idx != NF + 1) && (eval(idx+1,(val $idx) + 0) || eval(idx+1, (val*$idx)) || eval(idx+1, (val+$idx)))))
}
END{print n}

