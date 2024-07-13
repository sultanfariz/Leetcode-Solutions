func twoSum(nums []int, target int) []int {
  numsMap := make(map[int]int)
  for idx1, v := range nums {
    idx2, ok := numsMap[target-v]
    if ok {
      return []int{idx1, idx2}
    } else {
      numsMap[v] = idx1
    }
  }
  return []int{}
}
