func getLongestSubsequence(words []string, groups []int) []string {
  res := []string{}
  groupFiltered := []int{}
  for i, n := range groups {
    if len(groupFiltered) == 0 || groupFiltered[len(groupFiltered)-1] != n {
      groupFiltered = append(groupFiltered, n)
      res = append(res, words[i])
    }
  }  
  return res
}
