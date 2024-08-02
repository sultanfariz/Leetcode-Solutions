func minSwaps(nums []int) int {
  // retrieve the 1 appearances
  size := 0
  for _, el := range nums {
    if el == 1 { size++ }
  }

  ones := 0
  // fill the window
  for i:=0; i<size; i++ {
    if nums[i] == 1 {
      ones++
    }
  }
  maxOnes := ones

  i, j := 0, size
  // slide the window for all elements
  for i<len(nums) {
    if j == len(nums) { j=0 }
    if nums[j] == 1 { ones++ }
    if nums[i] == 1 { ones-- }
    if ones > maxOnes { maxOnes = ones }
    i++
    j++
  }

  return size - maxOnes
}
