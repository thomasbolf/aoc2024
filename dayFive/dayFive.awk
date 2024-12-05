function followRule(ruleLeft, ruleRight){
    return index($0, ruleLeft) < index($0, ruleRight) || index($0, ruleLeft) == 0 || index($0, ruleRight) == 0
}
rules==0{
      if(match($0, /[0-9]+\|[0-9]+/)){
            split($0, arr, "|")
            rulesLeft[NR] = arr[1]
            rulesRight[NR] = arr[2]
        }
        else{
            rules=1
        }
}
rules!=0{
     count = 0
        for(i = 1; i < length(rulesLeft); i++){count += followRule(rulesLeft[i], rulesRight[i]);}
        if(count+1==length(rulesLeft)){
            split($0, numbers, ",")
            middleIndex = int((length(numbers) + 1) / 2)
            $middleIndex = numbers[middleIndex]
            sum += $middleIndex
        }
}
END{print sum}