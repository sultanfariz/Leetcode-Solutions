func nearestPalindromic(n string) string {
  digitNum := len(n)
  half := digitNum/2
  firstHalf := n[:half]
  mid := n[half:digitNum-half]
  midNum, _ := strconv.Atoi(mid)
  num, _ := strconv.Atoi(n)  
  if num < 10 { return strconv.FormatInt(int64(num-1), 10) }

  palindromes := []int{}
  // generate mirrored palindrome
  firstHalfNum, _ := strconv.Atoi(firstHalf)
  secondHalfNum := reverseNumberStr(strconv.Itoa(firstHalfNum))
  pal, _ := strconv.Atoi(fmt.Sprintf("%d%s%s", firstHalfNum, mid, secondHalfNum))
  palindromes = append(palindromes, pal)
  if len(mid) > 0 {
    pal, _ = strconv.Atoi(fmt.Sprintf("%d%d%s", firstHalfNum, midNum-1, secondHalfNum))
    palindromes = append(palindromes, pal)
    pal, _ = strconv.Atoi(fmt.Sprintf("%d%d%s", firstHalfNum, midNum+1, secondHalfNum))
    palindromes = append(palindromes, pal)
  }

  // generate decremented mirrored palindrome
  secondHalfNum = reverseNumberStr(strconv.Itoa(firstHalfNum-1))
  pal, _ = strconv.Atoi(fmt.Sprintf("%d%s%s", firstHalfNum-1, mid, secondHalfNum))
  palindromes = append(palindromes, pal)
  if len(mid) > 0 {
    pal, _ = strconv.Atoi(fmt.Sprintf("%d%d%s", firstHalfNum-1, midNum-1, secondHalfNum))
    palindromes = append(palindromes, pal)
    pal, _ = strconv.Atoi(fmt.Sprintf("%d%d%s", firstHalfNum-1, midNum+1, secondHalfNum))
    palindromes = append(palindromes, pal)
  }

  // generate incremented mirrored palindrome
  secondHalfNum = reverseNumberStr(strconv.Itoa(firstHalfNum+1))
  pal, _ = strconv.Atoi(fmt.Sprintf("%d%s%s", firstHalfNum+1, mid, secondHalfNum))
  palindromes = append(palindromes, pal)
  if len(mid) > 0 {
    pal, _ = strconv.Atoi(fmt.Sprintf("%d%d%s", firstHalfNum+1, midNum-1, secondHalfNum))
    palindromes = append(palindromes, pal)
    pal, _ = strconv.Atoi(fmt.Sprintf("%d%d%s", firstHalfNum+1, midNum+1, secondHalfNum))
    palindromes = append(palindromes, pal)
  }

  // generate nine-formed palindrome
  nine := 9
  for i:=1; i<digitNum-1; i++ {
    nine = nine*10 + 9
  }
  palindromes = append(palindromes, nine)
  palindromes = append(palindromes, nine*10+9)

  // generate one-zeros-one palindrome
  one := 1
  for i:=1; i<digitNum; i++ {
    one *= 10
  }
  palindromes = append(palindromes, one+1)
  palindromes = append(palindromes, one*10+1)

  // calculate the closest difference
  minDiff, min := 0, 0
  for _, pal := range palindromes {
    diff := abs(pal, num)
    if minDiff == 0 {
      minDiff = diff
      min = pal
    }
    if minDiff > diff && diff != 0 {
      minDiff = diff
      min = pal
    } else if minDiff == diff && pal < min {
      min = pal
    }
  }

  return strconv.FormatInt(int64(min), 10)
}

func reverseNumberStr(num string) (res string) {
  for len(num) > 0 {
    res += num[len(num)-1:]
    num = num[:len(num)-1]
  }

  return
}

func abs(a, b int) int {
  if a > b {
    return a - b
  }
  return b - a
}
