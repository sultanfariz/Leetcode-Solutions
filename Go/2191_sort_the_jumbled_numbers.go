func sortJumbled(mapping []int, nums []int) []int {
  mapped := make(map[int][]int)
  keys := []int{}
  for _, v := range nums {
    mapRes := mapInt(mapping, v)
    mapped[mapRes] = append(mapped[mapRes], v)
    keys = append(keys, mapRes)
  }

  sort.Ints(keys)
  res := []int{}
  for _, k := range keys {
    if len(mapped[k]) == 0 { continue }
    res = append(res, mapped[k]...)
    delete(mapped, k)
  }

  return res
}

func mapInt(mapping []int, num int) int {
  res := ""
  for _, char := range fmt.Sprint(num){
    intChar, _ := strconv.Atoi(string(char))
    res = res + fmt.Sprint(mapping[intChar])
  }
  numMapped, _ := strconv.Atoi(res)
  return numMapped
}
