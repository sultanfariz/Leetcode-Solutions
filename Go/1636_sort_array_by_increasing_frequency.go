func frequencySort(nums []int) []int {
  freqMap, reverseMap := make(map[int]int), make(map[int][]int)  
  keys := []int{}
  res := []int{}
  for _, v := range nums {
    freqMap[v]++
  }

  for k, v := range freqMap {
    reverseMap[v] = append(reverseMap[v], k)
  }
  for k, _ := range reverseMap {
    keys = append(keys, k)
  }

  sort.Ints(keys) // sort to increasing order

  for _, key := range keys {
    sort.Ints(reverseMap[key]) // sort ascending
    n := len(reverseMap[key])
    for i:=n-1; i>=0; i-- {
      for j:=0; j<key; j++ {
        res = append(res, reverseMap[key][i])
      }
    }
  }

  return res
}
