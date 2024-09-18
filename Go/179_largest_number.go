func largestNumber(nums []int) string {
  strs := []string{}
  zeroFlag := true
  for _, num := range nums {
    if num > 0 { zeroFlag = false }
    strs = append(strs, strconv.Itoa(num))
  }
  if zeroFlag {
    return "0"
  }
  sort.Strings(strs)
  strs = reverse(strs)

  for range strs {
    for i,j:=0,1; j<len(strs); i,j=i+1,j+1 {
      if strs[i]+strs[j] < strs[j]+strs[i] {
        strs[i], strs[j] = strs[j], strs[i]
      }
    }
  }

  return strings.Join(strs, "")
}

func reverse(arr []string) []string{
  for i,j:=0,len(arr)-1; i<j; i,j=i+1,j-1 {
    arr[i], arr[j] = arr[j], arr[i]
  }

  return arr
}
