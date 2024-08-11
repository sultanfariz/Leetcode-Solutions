func checkValid(matrix [][]int) bool {
  // for each row & column check if the element is exists in the hash table
  for _, row := range matrix {
    intArr := [101]int{}
    for _, val := range row {
      if intArr[val] != 0 { return false }
      intArr[val] = val
    }
  }

  for i := range len(matrix) {
    intArr := [101]int{}
    for j := range len(matrix[0]) {
      val := matrix[j][i]
      if intArr[val] != 0 { return false }
      intArr[val] = val
    }
  }

  return true
}
