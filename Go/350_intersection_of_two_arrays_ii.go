func intersect(nums1 []int, nums2 []int) []int {
  sort.Ints(nums1)  
  sort.Ints(nums2)
  res := []int{}
  counter1, counter2 := 0, 0
  for {
    if nums1[counter1] < nums2[counter2] {
      counter1++
    } else if nums1[counter1] > nums2[counter2] {
      counter2++
    } else {
      res = append(res, nums1[counter1])
      counter1++
      counter2++
    }

    if counter1 == len(nums1) || counter2 == len(nums2) {
      break
    }
  }

  return res
}
