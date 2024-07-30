var (
  fibMap = make(map[int]int)
)

func fib(n int) int {
  if n == 0 { return 0 }
  if n == 1 { return 1 }

  if fibMap[n] == 0 {
    fibMap[n] = fib(n-1) + fib(n-2)
  }

  return fibMap[n]
}
