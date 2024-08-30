func plusOne(digits []int) []int {
  n := len(digits) - 1
  if n < 0 {
    return []int{1}
  }
  if digits[n] < 9 {
    digits[n]++
    return digits
  }

  return append(plusOne(digits[:n]), 0)
}
