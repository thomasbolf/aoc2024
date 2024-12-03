{
  col1[NR] = $1 + 0
  col2[NR] = $2 + 0
}
END {
  asort(col1, sorted_col1)
  asort(col2, sorted_col2)
  diff = 0 
  for (i = 1; i <= length(col1); i++) {
    diff = diff + ((sorted_col1[i] > sorted_col2[i]) ? sorted_col1[i] - sorted_col2[i] : sorted_col2[i] - sorted_col1[i])
    print sorted_col1[i], sorted_col2[i], diff
  }
  print diff
}
