func maxDepth(s string) int {
  depth, maxDepth := 0, 0
  for _, char := range s {
    if string(char) == "(" {
      depth++
    } else if string(char) == ")" {
      depth--
    }

    if depth > maxDepth {
      maxDepth = depth
    }
  } 
  return maxDepth
}
