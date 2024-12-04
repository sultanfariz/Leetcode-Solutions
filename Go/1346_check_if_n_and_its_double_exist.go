func checkIfExist(arr []int) bool {
  hashMap := map[int]bool{}

  for _, el := range arr {
    _, ok := hashMap[el]
    if ok {
      return true
    }

    hashMap[2*el] = true
    if el % 2 == 0 {
      hashMap[int(el/2)] = true
    }
  }

  return false

}
