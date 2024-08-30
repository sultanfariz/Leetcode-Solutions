func removeStones(stones [][]int) int {
  rows, cols := map[int][]int{}, map[int][]int{}
  visited := make([]int, len(stones))
  
  // put stones in grid
  for idx, stone := range stones {
    i, j := stone[0], stone[1]
    rows[i] = append(rows[i], idx)
    cols[j] = append(cols[j], idx)
  }

  // traverse stones using flood fill
  var traverse func(i int)
  traverse = func(i int) {
    if visited[i] != 0 {
      return
    }
    visited[i] = 1

    row, col := stones[i][0], stones[i][1]
    for _, stone := range rows[row] {
      traverse(stone)
    }
    for _, stone := range cols[col] {
      traverse(stone)
    }
  }

  counter := 0
  for i := range stones {
    if visited[i] != 0 { continue }
    counter++
    traverse(i)
  }

  return len(stones) - counter
}
