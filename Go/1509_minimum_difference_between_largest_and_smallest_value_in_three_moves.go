func minDifference(nums []int) int {
  n := len(nums)
  if n <= 4 {
    return 0
  }

  sort.Ints(nums)
  minDiff := nums[n-4] - nums[0]
  for i:=1; i<4; i++ {
    diff := nums[n-4+i] - nums[i] 
    if minDiff > diff {
      minDiff = diff
    }
  }

  return minDiff
}
