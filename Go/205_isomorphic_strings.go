func isIsomorphic(s string, t string) bool {
  sm := make(map[string]string)
  tm := make(map[string]string)

  for i, char := range s {
    _, ok1 := sm[string(char)]
    _, ok2 := tm[string(t[i])]
    sStr := string(char)
    tStr := string(t[i])
    if !ok1 {
      sm[string(char)] = tStr
    } 
    if !ok2 {
      tm[string(t[i])] = sStr
    }
    if sm[string(char)] != tStr || tm[string(t[i])] != sStr {
      return false
    }
  }
  return true
}
