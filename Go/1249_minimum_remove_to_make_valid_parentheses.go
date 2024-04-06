func minRemoveToMakeValid(s string) string {
  idxArr := []int{}
  depth, remCount := 0, 0
  for i, char := range s {
    if string(char) == "(" {
      idxArr = append(idxArr, i)
      depth++
    } else if string(char) == ")" {
      if depth == 0 {
        idxArr = append(idxArr, i)
        continue
      }
      idxArr = idxArr[:len(idxArr)-1]
      depth--
    }
  }
  for _, idx := range idxArr {
    s = s[:idx-remCount] + s[idx+1-remCount:]
    remCount++
  }
  return s
}
