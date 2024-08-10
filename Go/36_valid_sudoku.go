func isValidSudoku(board [][]byte) bool {
  // iterate row
  for i := range 9 {
    charMap := make(map[byte]bool)
    for _, char := range board[i] {
      if string(char) == "." { continue }
      if charMap[char] { return false }
      charMap[char] = true
    }
  }
  
  // iterate col
  for i := range 9 {
    charMap := make(map[byte]bool)
    for j := range 9 {
      char := board[j][i]
      if string(char) == "." { continue }
      if charMap[char] { return false }
      charMap[char] = true
    }
  }

  // iterate sub-boxes
  subboxesEdge := [][]int{
    []int{0, 0},
    []int{0, 3},
    []int{0, 6},
    []int{3, 0},
    []int{3, 3},
    []int{3, 6},
    []int{6, 0},
    []int{6, 3},
    []int{6, 6},
  }
  for _, edge := range subboxesEdge {
    charMap := make(map[byte]bool)
    for i := range 3 {
      for j := range 3 {
        char := board[edge[0]+i][edge[1]+j]
        if string(char) == "." { continue }
        if charMap[char] { return false }
        charMap[char] = true
      }
    }
  }

  return true
}
