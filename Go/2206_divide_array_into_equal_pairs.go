func divideArray(nums []int) bool {
  numMap := map[int]int{}
  for _, num := range nums {
    numMap[num]++
  }

  for _, v := range numMap {
    if v%2 != 0 {
      return false
    }
  }

  return true
}
