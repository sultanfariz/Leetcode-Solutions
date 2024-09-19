func diffWaysToCompute(expression string) []int {
  res := []int{}

  if len(expression) <= 2 {
    num, _ := strconv.Atoi(expression)
    return []int{num}
  }

  for i, char := range expression {
    strChar := string(char)
    if strChar != "+" && strChar != "-" && strChar != "*" {
      continue
    }

    left := diffWaysToCompute(expression[:i])
    right := diffWaysToCompute(expression[i+1:])

    for _, l := range left {
      for _, r := range right {
        switch strChar {
        case "+":
          res = append(res, l+r)
        case "-":
          res = append(res, l-r)
        case "*":
          res = append(res, l*r)
        }
      }
    }
  }

  return res
}