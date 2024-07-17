func findJudge(n int, trust [][]int) int {
  if n == 1 {
    return 1
  }

  trustMap := make(map[int]int)
  for _, v := range trust {
    trustMap[v[0]]--
    trustMap[v[1]]++
  }

  for k, v := range trustMap {
    if v == n-1 {
      return k
    }
  }

  return -1
}
