{
    while (match($0, /don't\([^)]*\) [^d]*do\(\)/)) {
        $0 = substr($0, 1, RSTART-1) "do()" substr($0, RSTART+RLENGTH)
    }
    print $0
}
