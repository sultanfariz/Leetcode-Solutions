func clearDigits(s string) string {
  stack := []string{} 
  for _, char := range s {
    num, _ := strconv.Atoi(string(char))
    if num == 0 && string(char) != "0" {
      stack = append(stack, string(char))
      continue
    }

    stack = stack[:len(stack)-1]
  }

  return strings.Join(stack, "")
}
