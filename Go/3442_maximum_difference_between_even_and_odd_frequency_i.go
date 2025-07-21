func maxDifference(s string) int {
  charMap := map[string]int{}
  for _, char := range s {
    str := string(char)
    charMap[str]++
  }

  var minEven, maxOdd string
  for k, v := range charMap {
    if v % 2 == 0 {
      if v < charMap[minEven] || minEven == "" {
        minEven = k
      }
    } else if v % 2 != 0 && v > charMap[maxOdd] {
      maxOdd = k
    }
  }

  return charMap[maxOdd] - charMap[minEven]
}
