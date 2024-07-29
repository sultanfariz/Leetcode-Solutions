func countBits(n int) []int {
  res := []int{}
  powerCount := 0
  for i := range n+1 {
    if i <= 1 {
      res = append(res, i)
      continue
    }

    if float64(i) == math.Pow(float64(2), float64(powerCount+1)) {
      res = append(res, 1)
      powerCount++
      continue
    }

    nearestOne := int(math.Pow(float64(2), float64(powerCount)))
    res = append(res, res[nearestOne] + res[i-nearestOne])
  }

  return res
}
