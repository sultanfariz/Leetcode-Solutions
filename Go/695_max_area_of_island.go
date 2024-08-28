func maxAreaOfIsland(grid [][]int) int {
  // count the area of island using flood fill algorithm
  // define map to store each island's area
  islandArea := map[int]int{}
  // maintain the max area count
  max := 0
  // define flood fill function
  counter := 1
  var floodFill func(i, j, counter int)
  floodFill = func(i, j, counter int) {
    if grid[i][j] != 1 {
      return
    }

    grid[i][j] = counter
    islandArea[counter]++
    if islandArea[counter] > max {
      max = islandArea[counter]
    }
    if i > 0 {
      floodFill(i-1, j, counter)
    }
    if j > 0 {
      floodFill(i, j-1, counter)
    }
    if i < len(grid)-1 {
      floodFill(i+1, j, counter)
    }
    if j < len(grid[0])-1 {
      floodFill(i, j+1, counter)
    }
  }

  // iterate each tile of grid
  for i, row := range grid {
    for j := range row {
      // if tile is land and not marked yet, apply the flood fill function
      if grid[i][j] == 1 {
        // increment the counter
        counter++
        floodFill(i, j, counter)
      }
    }
  }

  return max
}
