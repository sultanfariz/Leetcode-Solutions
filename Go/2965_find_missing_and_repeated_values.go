func findMissingAndRepeatedValues(grid [][]int) []int {
  n := len(grid)
  numMap := map[int]int{}
  for _, row := range grid {
    for _, num := range row {
      numMap[num]++
    }
  }

  repeated, missing := grid[0][0], grid[0][1]
  for i := range n*n {
    v, ok := numMap[i+1]
    if !ok || v == 0 {
      missing = i+1
    }
    if v > 1 {
      repeated = i+1
    }
  }

  return []int{repeated, missing}
}
