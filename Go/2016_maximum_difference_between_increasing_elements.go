func maximumDifference(nums []int) int {
  min := nums[0]
  max := nums[0]
  diff := -1
  for _, v := range nums {
    if v >= min && v <= max {
      continue
    }

    if v < min {
      min = v
      max = v
    }
    if v > max { 
      max = v 
    }

    if min != max && (max - min) > diff {
      diff = max - min
    }
  }

  return diff
}
