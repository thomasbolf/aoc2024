{
             
    while (match($0, /mul\(([0-9]{1,3}), *([0-9]{1,3})\)/, matches)) {
        product = (matches[1]+0) * (matches[2]+0) # Compute product
        total += product # Add to total sum
        $0 = substr($0, 1, RSTART-1) result substr($0, RSTART+RLENGTH) 
    }
    print "Total sum of products:", total
}
