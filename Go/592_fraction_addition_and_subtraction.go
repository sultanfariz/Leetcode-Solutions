func fractionAddition(expression string) string {
  noms, denoms := exp2Fraction(expression)
  divisor := denoms[0]
  for _, denom := range denoms {
    divisor = commonMultiple(divisor, denom)
  }

  res := 0
  for i, nom := range noms {
    res += nom * int(divisor/denoms[i])
  }

  gcd := gcd(res, divisor)
  return fmt.Sprintf("%d/%d", res/gcd, divisor/gcd)
}

func commonMultiple(a, b int) int {
  if a%b == 0 {
    return a
  } else if b%a == 0 {
    return b
  }
  return a*b
}

func gcd(a, b int) int {
  if a < 0 { a *= -1 }
  if b < 0 { b *= -1 }
  if b == 0 { return a }
  return gcd(b, a%b)
}

func exp2Fraction(exp string) ([]int, []int) {
  noms, denoms := []int{}, []int{}
  carry := 0
  isNegative := false
  for i, char := range exp {
    str := string(char)
    if str == "/" {
      if isNegative { carry *= -1 }
      noms = append(noms, carry)
      carry = 0
      isNegative = false
    } else if str == "+" || str == "-" {
      isNegative = false
      if str == "-" {
        isNegative = true
        if i == 0 { continue }
      }
      denoms = append(denoms, carry)
      carry = 0
    } else {
      num, _ := strconv.Atoi(str)
      carry = (carry * 10) + num
    }
  }
  if carry != 0 {
    denoms = append(denoms, carry)
  }
  return noms, denoms
}
