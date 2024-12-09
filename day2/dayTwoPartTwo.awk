function sign(a){
    return a > 0 ? 1 : -1;
}
function abs(a){
	return a > 0? a: -a;
}
function checkRow(skip, arr, pos, s, i, count, distance) {
    for(i = 1; i <= NF; ++i){
        if(i != skip) arr[++pos] = $i
    }
    s = sign(arr[2] - arr[1])
    for(i = 2; i < NF; ++i){
            if(s != sign(arr[i] - arr[i-1])) return 0
            distance = abs(arr[i] - arr[i-1]);
            if(distance < 1 || distance > 3) return 0
    }
	return 1

}

{
      s = sign($1 - $2)
    if (!checkRow()) {
        for (i = 1; i <= NF; i++) {
            if (checkRow(i))
                break
        }
        if (i > NF)
            next
    }
    n++
}
END{
print n
}
