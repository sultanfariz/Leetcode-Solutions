func minDays(grid [][]int) int {
  // check if islands disconnected
  islands := countIsland(grid)
  if islands != 1 { return 0 }

  // bruteforce to flip every tile
  for i, row := range grid {
    for j, val := range row {
      if val == 1 {
        grid[i][j] = 0
        islands = countIsland(grid)
        if islands != 1 { return 1 }
        grid[i][j] = 1
      }
    }
  }

  return 2
}

func countIsland(grid [][]int) int {
  visited := [30][30]bool{}
  counter := 1
  for i, row := range grid {
    for j, val := range row {
      if val == 1 && !visited[i][j] {
        counter++
        exploreIsland(grid, &visited, i, j)
      }
    }
  }

  return counter-1
}

func exploreIsland(grid [][]int, visited *[30][30]bool, row, col int) {
  if grid[row][col] == 1 { 
    visited[row][col] = true
  }

  if row < len(grid)-1 && grid[row+1][col] == 1 && !visited[row+1][col] {
    exploreIsland(grid, visited, row+1, col)
  }
  if col < len(grid[0])-1 && grid[row][col+1] == 1 && !visited[row][col+1] {
    exploreIsland(grid, visited, row, col+1)
  }
  if row > 0 && grid[row-1][col] == 1 && !visited[row-1][col] {
    exploreIsland(grid, visited, row-1, col)
  }
  if col > 0 && grid[row][col-1] == 1 && !visited[row][col-1] {
    exploreIsland(grid, visited, row, col-1)
  }
}
