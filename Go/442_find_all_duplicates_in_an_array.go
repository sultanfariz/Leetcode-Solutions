func findDuplicates(nums []int) []int {
  res := []int{}
  for _, v := range nums {
    if v < 0 {
      v *= -1
    }
    if nums[v-1] > 0 {
      nums[v-1] *= -1
    } else {
      res = append(res, v)
    }
  }
  return res
}
