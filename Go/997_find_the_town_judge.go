func findJudge(n int, trust [][]int) int {
  if n == 1 {
    return 1
  }

  trusts := make([]int, n+1)
  for _, v := range trust {
    trusts[v[0]]--
    trusts[v[1]]++
  }

  for k, v := range trusts {
    if v == n-1 {
      return k
    }
  }

  return -1
}
