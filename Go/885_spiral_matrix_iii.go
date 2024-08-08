func spiralMatrixIII(rows, cols, rStart, cStart int) [][]int {
  res := [][]int{{rStart, cStart}}
  directions := []string{"R", "D", "L", "U"}
  row, col, directionIndex, iter, maxIter := rStart, cStart, 0, 1, 1
  count := 1

  for count < rows*cols {
    direction := directions[directionIndex]
    for i := 0; i < iter; i++ {
      switch direction {
      case "R":
        col++
      case "D":
        row++
      case "L":
        col--
      case "U":
        row--
      }

      if isCoordinateValid(rows, cols, row, col) {
        res = append(res, []int{row, col})
        count++
      }
    }

    // Update direction and iteration counts
    if directionIndex == 1 || directionIndex == 3 {
      maxIter++
    }
    iter = maxIter
    directionIndex = (directionIndex + 1) % 4
  }

  return res
}

func isCoordinateValid(rows, cols, row, col int) bool {
    return row >= 0 && row < rows && col >= 0 && col < cols
}
