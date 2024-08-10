func numMagicSquaresInside(grid [][]int) int {
  res := 0
  rows := len(grid)
  cols := len(grid[0])
  if rows < 3 || cols < 3 {
    return res
  }

  i, j := 0, 0
  for i <= rows-3 {

    for j <= cols-3 {
      square := [][]int{
        []int{grid[i][j], grid[i][j+1], grid[i][j+2]},
        []int{grid[i+1][j], grid[i+1][j+1], grid[i+1][j+2]},
        []int{grid[i+2][j], grid[i+2][j+1], grid[i+2][j+2]},
      }

      if isMagic(square) { res++ }
      j++
    }
    j = 0
    i++
  }
  
  return res
}

func isMagic(grid [][]int) (res bool) {
  if len(grid) != 3 || len(grid[0]) != 3 { return } 

  numMap := make(map[int]bool)
  for i := range 3 {
    for j := range 3 {
      if grid[i][j] > 9 || grid[i][j] < 1 { return }
      if numMap[grid[i][j]] { return }
      numMap[grid[i][j]] = true
    }
  }

  diagonal := grid[0][0] + grid[1][1] + grid[2][2]
  if (grid[0][2] + grid[1][1] + grid[2][0]) != diagonal { return }

  for i := range 3 {
    if (grid[i][0] + grid[i][1] + grid[i][2]) != diagonal { return }
  }
  for i := range 3 {
    if (grid[0][i] + grid[1][i] + grid[2][i]) != diagonal { return }
  }

  return true
}
