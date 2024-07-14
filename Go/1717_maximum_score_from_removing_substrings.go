func maximumGain(s string, x int, y int) int {
  substr1, substr2 := "ab", "ba"
  point1, point2 := x, y
  if x < y {
    substr1, substr2 = "ba", "ab"
    point1, point2 = y, x
  }
  str1, points1 := removeSubstring(s, substr1, point1)
  _, points2 := removeSubstring(str1, substr2, point2)
  return points1 + points2
}

func removeSubstring(s, substr string, point int) (string, int) {
  points := 0
  n := len(s)
  stack := []byte{}
  for i:=0; i<n; i++ {
    if len(stack)>0 && string(stack[len(stack)-1])+string(s[i]) == substr {
      stack = stack[:len(stack)-1]
      points += point
    } else {
      stack = append(stack, s[i])
    }
  }
  return string(stack), points
}
