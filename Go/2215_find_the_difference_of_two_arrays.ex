func findDifference(nums1 []int, nums2 []int) [][]int {
  map1, map2 := make(map[int]bool), make(map[int]bool)
  for _, el := range nums1 {
    map1[el] = true
  }
  for _, el := range nums2 {
    map2[el] = true
  }

  res1, res2 := []int{}, []int{}
  for k, _ := range map1 {
    if !map2[k] {
      res1 = append(res1, k)
    }
  }
  for k, _ := range map2 {
    if !map1[k] {
      res2 = append(res2, k)
    }
  }

  return [][]int{res1, res2}
}
