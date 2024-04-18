func islandPerimeter(grid [][]int) int {
  res := 0
  posMasking := [][]int{{-1,0},{0,-1},{1,0},{0,1}}
  gridLen := len(grid)
  for i, row := range grid {
    rowLen := len(row)
    for j, col := range row {
      if col == 0 {
        continue
      }
      for _, mask := range posMasking {
        x := i + mask[0]
        y := j + mask[1]
        if x >= gridLen || y >= rowLen || x < 0 || y < 0 || grid[x][y] == 0 {
          res++
        }
      }
    }
  }
  return res
}
