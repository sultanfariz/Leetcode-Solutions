func sortPeople(names []string, heights []int) []string {
  heightMap := make(map[int]string)
  for i, v := range heights {
    heightMap[v] = names[i]
  }
  
  sort.Ints(heights)
  res := []string{}
  for i:=len(heights)-1; i>=0; i-- {
    res = append(res, heightMap[heights[i]])
  }

  return res
}
