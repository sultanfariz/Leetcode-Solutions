func numIslands(grid [][]byte) int {
  counter := 0

  for i, row := range grid {
    for j, val := range row {
      if string(val) == "1" {
        counter++
        exploreIsland(grid, i, j)
      }
    }
  }

  return counter
}

func exploreIsland(grid [][]byte, row, col int) {
  if string(grid[row][col]) == "1" {
    grid[row][col] = ([]byte("2"))[0]
  }

  if row < len(grid)-1 && string(grid[row+1][col]) == "1" {
    exploreIsland(grid, row+1, col)
  }
  if col < len(grid[0])-1 && string(grid[row][col+1]) == "1" {
    exploreIsland(grid, row, col+1)
  }
  if row > 0 && string(grid[row-1][col]) == "1" {
    exploreIsland(grid, row-1, col)
  }
  if col > 0 && string(grid[row][col-1]) == "1" {
    exploreIsland(grid, row, col-1)
  }
}
