func restoreMatrix(rowSum []int, colSum []int) [][]int {
  rowLen := len(rowSum)
  colLen := len(colSum)
  res := make([][]int, rowLen)
  for i := range res {
    res[i] = make([]int, colLen)
  }
  for i := range rowSum {
    for j := range colSum {
      res[i][j] = min(rowSum[i], colSum[j])
      rowSum[i] -= res[i][j]
      colSum[j] -= res[i][j]
    }
  }

  return res
}

func min(a, b int) int {
  if a < b { return a }
  return b
}
