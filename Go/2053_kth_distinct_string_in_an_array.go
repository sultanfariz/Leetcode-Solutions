func kthDistinct(arr []string, k int) string {
  // put all elements into hashmap
  elements := make(map[string]int)
  for _, el := range arr {
    elements[el]++
  }

  // retrieve elements that appear only once
  once := []string{}
  for _, el := range arr {
    // check if the counter equals to 1
    if elements[el] == 1 {
      once = append(once, el)
    }
  }

  // iterate distinct array to obtain the k-th element
  if k > len(arr) { return "" }
  k--
  res := ""
  for i, el := range once {
    if i == k {
      res = el
      break
    }
  }
  return res
}
