func countGoodTriplets(arr []int, a int, b int, c int) int {
  counter := 0

  for i:=0; i<len(arr)-2; i++ {
    for j:=i+1; j<len(arr); j++ {
      for k:=j+1; k<len(arr); k++ {
        if isGoodTriplets(arr, a, b, c, i, j, k) {
          counter++
        }
      }
    }
  }   

  return counter
}

func isGoodTriplets(arr []int, a, b, c, i, j, k int) bool {
  if abs(arr[i] - arr[j]) <= a &&
    abs(arr[j] - arr[k]) <= b &&
    abs(arr[i] - arr[k]) <= c {
      return true
    }
    
    return false
}

func abs(n int) int {
  if n < 0 {
    return n * -1
  }

  return n
}
