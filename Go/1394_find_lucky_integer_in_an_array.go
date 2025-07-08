func findLucky(arr []int) int {
  numMap := map[int]int{}
  for _, v := range arr {
    numMap[v]++
  }
  
  lucky := -1
  for k, v := range numMap {
    if k > lucky && k == v {
      lucky = k
    }
  }

  return lucky
}
