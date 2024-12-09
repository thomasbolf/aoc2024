
{
count1[$1]++
count2[$2]++
}
END {
sim = 0
for(val in count1){ 
	sim = sim + val*count1[val]*count2[val]
}

print(sim)


}
