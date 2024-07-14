func twoSum(numbers []int, target int) []int {
  left, right := 0, len(numbers)-1
  for {
    sum := numbers[left] + numbers[right]
    if sum > target {
      right--
    } else if sum < target {
      left++
    } else {
      return []int{left+1, right+1}
    }
  }
  return []int{left+1, right+1}
}
