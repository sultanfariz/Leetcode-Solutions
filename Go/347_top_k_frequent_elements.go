func topKFrequent(nums []int, k int) []int {
  occurences := make(map[int]int)
  for _, v := range nums {
    occurences[v]++
  }
  reversedOcc := make(map[int][]int)
  keys := []int{}
  for k, v := range occurences {
    reversedOcc[v] = append(reversedOcc[v], k)
    keys = append(keys, v)
  }
  
  sort.Ints(keys)
  res := []int{}
  for i:=len(keys)-1; i>=0; i-- {
    v := keys[i]
    for _, count := range reversedOcc[v] {
      if k == 0 {
        return res
      }
      res = append(res, count)
      k--
    }
    delete(reversedOcc, v)
  }
  return res
}
