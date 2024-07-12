func reverseParentheses(s string) string {
  inner := ""
  for i, char := range s {
    if char == 40 {
      inner = reverseParentheses(s[i+1:])
      str := fmt.Sprintf("%s%s", string(s[:i]), inner)
      return reverseParentheses(str)
    }
    if char == 41 {
      return reverseString(s[:i]) + s[i+1:]
    }
  }
  return s
}

func reverseString(s string) string {
  chars := []byte{}
  for i:=len(s)-1; i>=0; i-- {
    chars = append(chars, s[i])
  }
  return string(chars)
}
