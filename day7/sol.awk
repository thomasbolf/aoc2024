BEGIN{FS=":* "; n=0}
eval2(3,$2){
	n+=$1
}
eval1(3,$2){
	m += $1
}
function eval1(idx, val){
	return (val <= $1) && ( (idx==NF+1 && val==$1) ||( (idx != NF + 1) && (eval1(idx+1,(val $idx) + 0) || eval1(idx+1, (val*$idx)) || eval1(idx+1, (val+$idx)))))
}
function eval2(idx, val){
        return (val <= $1) && ( (idx==NF+1 && val==$1) ||( (idx != NF + 1) &&  ( eval2(idx+1, (val*$idx)) || eval2(idx+1, (val+$idx)))))

	}
END{print n " " m}

