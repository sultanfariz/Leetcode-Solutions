func dividePlayers(skill []int) int64 {
  n := len(skill)
  sum := 0
  numMap := map[int]int{}
  for _, num := range skill {
    numMap[num]++
    sum += num
  }
  if sum%(n/2) != 0 { return -1 }

  res := []int{}
  target := sum / (n/2)
  for _, num := range skill {
    if numMap[num] <= 0 { continue }
    if numMap[target-num] <= 0 { return -1 }
    numMap[num]--
    numMap[target-num]--
    res = append(res, num)
    res = append(res, target-num)
  }

  chem := int64(0)
  for i:=0; i<len(res); i+=2 {
    chem += int64(res[i] * res[i+1])
  }

  return chem
}
