func lexicalOrder(n int) []int {
  return rec(1, n)
}

func rec(last, n int)[]int {
  res := []int{}
  for i:=0; i<10; i++ {
    if last + i > n || (last==1 && i==9) {
      break
    }
    num := last + i
    res = append(res, num)
    if num*10 <= n {
      arr := rec(num*10, n)
      res = append(res, arr...)
    }
  }

  return res
}
