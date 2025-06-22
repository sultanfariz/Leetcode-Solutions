func divideString(s string, k int, fill byte) []string {
  res := []string{}
  for i:=0; i<len(s); i+=k {
    temp := ""
    for j:=0; j<k; j++ {
      added := string(fill)
      if i+j < len(s) {
        added = string(s[i+j])
      }
      temp+=added
    }
    res = append(res, temp)
  }

  return res
}
