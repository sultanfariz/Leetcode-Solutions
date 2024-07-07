func passThePillow(n int, time int) int {
  maxCycle := 2*n-2
  x := (time+1)%(maxCycle)
  if x == 0 {
    return 2
  } else if x <= n {
    return x
  } 
  
  return 2*n - x
}
