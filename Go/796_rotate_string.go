func rotateString(s string, goal string) bool {
  if len(s) != len(goal) {
    return false
  }

  for i:=0; i<len(goal); i++ {
    s = s[1:] + s[:1]
    if s == goal {
      return true
    }
  }

  return false
}
