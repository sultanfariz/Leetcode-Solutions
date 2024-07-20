func luckyNumbers (matrix [][]int) []int {
  rowLen := len(matrix)
  colLen := len(matrix[0])
  rowMinMap := make(map[int]int)
  colMaxMap := make(map[int]int)
  res := []int{}
  for i:=0; i<rowLen; i++ {
    for j:=0; j<colLen; j++ {
      val := matrix[i][j]
      if rowMinMap[i] > val || rowMinMap[i] == 0 {
        rowMinMap[i] = val
      }
      if colMaxMap[j] < val {
        colMaxMap[j] = val
      }
    }
  }
  for i:=0; i<rowLen; i++ {
    for j:=0; j<colLen; j++ {
      if rowMinMap[i] == colMaxMap[j] {
        res = append(res, colMaxMap[j])
      }
    }
  }

  return res
}
