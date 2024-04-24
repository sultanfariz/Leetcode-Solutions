func tribonacci(n int) int {
  arr := []int{0,1,1}
  if n > 2 {
    for i:=3; i<=n; i++ {
      temp := arr[i-3] + arr[i-2] + arr[i-1]
      arr = append(arr, temp)
    }
  }
  return arr[n]
}
