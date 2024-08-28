func countSubIslands(grid1 [][]int, grid2 [][]int) int {
  // count the islands in grid2
  counter := 0
  islandMap := [500][500]int{}

  // flood filling algo -> starting from chosen tile, then mark every tiles adjacent into the tile
  var counterIsland func(row, col, counter int)
  counterIsland = func(row, col, counter int) {
    if islandMap[row][col] != 0 || grid2[row][col] != 1 {
      return
    }

    // [2,2] -> [1,2] [2,1] [3,2] [2,3] ->
      // if adjacent tile is land, mark with island number
    islandMap[row][col] = counter
    if row > 0 {
      counterIsland(row-1, col, counter)
    }
    if row < len(grid2)-1 {
      counterIsland(row+1, col, counter)
    }
    if col > 0 {
      counterIsland(row, col-1, counter)
    }
    if col < len(grid2[0])-1 {
      counterIsland(row, col+1, counter)
    }
  }

  // iterate all tiles, skip if tile is water or already been marked
  for i, row := range grid2 {
    for j := range row {
      if islandMap[i][j] != 0 || grid2[i][j] != 1 {
        continue
      }
      // if it is encounter new land without mark, increment the counter
      counter++
      counterIsland(i, j, counter)
    }
  }

  // define list of not valid subislands
  notValid := map[int]int{}
  // iterate all tiles in grid2
  for i, row := range grid2 {
    for j := range row {
      // check if the tile being iterated exist in grid1
      // if not exist, exclude the island number
      tile1 := grid1[i][j]
      tile2 := islandMap[i][j]
      if tile1 != 1 && tile2 != 0 {
        notValid[tile2] = 1
      }
    }
  }

  // return the counter being subtracted with length of excluded island
  for _, v := range notValid {
    if v == 1 {
      counter--
    }
  }
  return counter
}
