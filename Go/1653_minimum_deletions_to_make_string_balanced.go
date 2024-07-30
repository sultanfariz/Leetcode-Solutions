func minimumDeletions(s string) int {
  n := len(s)-1
  falseA, falseB := []int{0}, []int{0}
  for i, j := 0, n; j>0; i, j = i+1, j-1 {
    resA, resB := 0, 0
    if string(s[j]) == "a" {
      resA = 1
    }
    if string(s[i]) == "b" {
      resB = 1
    }

    falseA = append(falseA, falseA[n-j] + resA)
    falseB = append(falseB, falseB[i] + resB)
  }

  n = len(falseB)-1
  min := falseA[0] + falseB[n]
  for i, v := range falseA {
    if v + falseB[n-i] < min {
      min = v + falseB[n-i]
    }
  }
  return min
}
