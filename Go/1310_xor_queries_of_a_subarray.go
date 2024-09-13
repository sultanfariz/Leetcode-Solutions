func xorQueries(arr []int, queries [][]int) []int {
  res := []int{}
  for _, i := range queries {
    vals := arr[i[0]:i[1]+1]
    xor := 0
    for _, val := range vals {
      xor = xor ^ val
    }
    res = append(res, xor)
  }  
  return res
}
