func minimumPushes(word string) int {
  // map letter here
  letters := make(map[rune]int)
  for _, char := range word {
    letters[char]++
  }

  // sort by highest frequency desc
  freqs := []int{}
  for _, v := range letters {
    freqs = append(freqs, v)
  }
  sort.Ints(freqs)
  freqs = reverse(freqs)

  // for every count from highest, multiply with 1, after 8 elems, increment the multiplier
  res := 0
  for i, v := range freqs {
    res += v * (i/8 + 1)
  }
   return res
}

func reverse(arr []int) []int {
  for i, j := 0, len(arr)-1; i<j; i, j = i+1, j-1 {
    arr[i], arr[j] = arr[j], arr[i]
  }

  return arr
}
