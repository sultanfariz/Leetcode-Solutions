func arrayRankTransform(arr []int) []int {
  temp := []int{}
  for _, v := range arr {
    temp = append(temp, v)
  }
  sort.Ints(temp)

  counter := 1
  intMap := map[int]int{}
  for _, v := range temp {
    if intMap[v] == 0 {
      intMap[v] = counter
      counter++
    }
  }

  res := []int{}
  for _, v := range arr {
    res = append(res, intMap[v])
  }

  return res
}
