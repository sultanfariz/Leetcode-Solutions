func minMaxDifference(num int) int {
  max := intMap(num, 9)  
  min := intMap(num, 0)  
  return max - min
}

func intMap(num, n int) int {
  arr := []int{}
  for {
    if num == 0 {
      break
    }

    arr = append([]int{num%10}, arr...)
    num /= 10
  }

  toBeReplaced := -1
  res := 0
  for _, v := range arr {
    if v != n && toBeReplaced < 0 {
      toBeReplaced = v
    }

    val := v
    if v == toBeReplaced {
      val = n
    }

    res = res*10 + val
  }

  return res
}
