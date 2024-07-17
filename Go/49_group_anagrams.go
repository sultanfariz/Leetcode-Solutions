func groupAnagrams(strs []string) [][]string {
  var (
    strMap = make(map[string][]int)
    res [][]string
  )
  for i, str := range strs {
    newStr := rearrangeStr(str)
    strMap[newStr] = append(strMap[newStr], i)
  }

  for _, v := range strMap {
    similar := []string{}
    for _, i := range v {
      similar = append(similar, strs[i])
    }

    res = append(res, similar)
  }

  return res
}

func rearrangeStr(str string) string {
  res := []byte{}
  for i, _ := range str {
    res = append(res, str[i])
  }
  sort.Slice(res, func(i, j int) bool {
    return res[i] < res[j]
  })
  return string(res)
}
