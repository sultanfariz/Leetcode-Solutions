func maximumImportance(n int, roads [][]int) int64 {
  cities := make(map[int]int)
  for _, el := range roads {
    cities[el[0]]++
    cities[el[1]]++
  }
  
  citiesArr := []int{}
  for _, v := range cities {
    citiesArr = append(citiesArr,  v)
  }

  sortedCities := citiesArr
  sort.Ints(sortedCities)
  res, acc := 0, n-len(sortedCities)+1
  for _, v := range sortedCities {
    res += acc*v
    acc++
  }

  return int64(res)
}
