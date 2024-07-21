func runningSum(nums []int) []int {
  n := len(nums)
  res := make([]int, n)
  res[0] = nums[0]
  for i:=1; i<n; i++ {
    res[i] = res[i-1] + nums[i]
  }

  return res
}
