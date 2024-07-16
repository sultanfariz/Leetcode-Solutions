func threeSum(nums []int) [][]int {
  var (
    res [][]int
    uniqueResMap = make(map[string]bool)
  )
  sort.Ints(nums)
  
  for i, _ := range nums {
    target := 0 - nums[i]
    l, r := i+1, len(nums)-1
    for {
      if l >= r {
        break
      }

      sum := nums[l] + nums[r]
      if sum == target {
        resCheck := fmt.Sprintf("%d%d%d", nums[i], nums[l], nums[r])
        if uniqueResMap[resCheck] != true {
          res = append(res, []int{nums[i], nums[l], nums[r]})
          uniqueResMap[resCheck] = true
        }
        l++
        r--
      } else if sum < target {
        l++
      } else {
        r--
      }
    }
  }

  return res
}
