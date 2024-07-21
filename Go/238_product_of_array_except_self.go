func productExceptSelf(nums []int) []int {
  left := leftProduct(nums)
  right := rightProduct(nums)
  res := []int{}
  for i, v := range left {
    res = append(res, v * right[i])
  }
  return res
}

func leftProduct(nums []int) []int {
  res := []int{}
  for i := range nums {
    if i == 0 {
      res = append(res, 1)
      continue
    }

    res = append(res, res[i-1] * nums[i-1])
  }

  return res
}

func rightProduct(nums []int) []int {
  n := len(nums)
  res := make([]int, n)
  res[n-1] = 1
  for i:=n-2; i>=0; i-- {
    res[i] = res[i+1] * nums[i+1]
  }

  return res
}
