func findTheLongestSubstring(s string) int {
  // map the string into bitmask
  charMap := map[string]int{
    "a": 1,
    "i": 2,
    "u": 4,
    "e": 8,
    "o": 16,
  }
  bitmask := []int{}
  for _, char := range s {
    bitmask = append(bitmask, charMap[string(char)])
  }

  // calculate the prefix sum xor
  pref := []int{0}
  xor := 0
  for _, bit := range bitmask {
    xor ^= bit
    pref = append(pref, xor)
  }

  first := map[int]int{}
  maxLen := 0
  for i, v := range pref {
    if first[v] == 0 && i == 0 {
      first[v] = i
    }

    if first[v] == 0 && pref[0] != v {
      first[v] = i
    }

    len := i - first[v]
    if len >= maxLen {
      maxLen = len
    }
  }
  return maxLen
}
