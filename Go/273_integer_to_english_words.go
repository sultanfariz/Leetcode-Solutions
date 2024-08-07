var (
  dict = map[int]string {
    1: "One",
    2: "Two",
    3: "Three",
    4: "Four",
    5: "Five",
    6: "Six",
    7: "Seven",
    8: "Eight",
    9: "Nine",
    10: "Ten",
    11: "Eleven",
    12: "Twelve",
    13: "Thirteen",
    14: "Fourteen",
    15: "Fifteen",
    18: "Eighteen",
    20: "Twenty",
    30: "Thirty",
    40: "Forty",
    50: "Fifty",
    80: "Eighty",
  }
)

func numberToWords(num int) string {
  if num == 0 { return "Zero" }

  // below thousands
  res, num := belowThousandsToWords(num)
  if num <=0 { return res }

  // thousands-million-billion
  for _, unit := range []string{"Thousand", "Million", "Billion"} {
    thousands := num % 1000
    num -= thousands
    num /= 1000
    thousandsStr := aboveThousandsToWords(thousands, unit)
    if thousandsStr != "" {
      if res == "" {
        res = thousandsStr
      } else {
        res = thousandsStr + " " + res
      }
    }
    if num <= 0 { return res }
  }

  return res
}

func tensToWords(tens int) string {
  if dict[tens] != "" {
    return dict[tens]
  } else {
    ones := tens % 10
    tens -= ones
    if tens < 10 { return "" }
    if tens < 20 {
      return dict[ones] + "teen"
    }
    res := dict[tens]
    if dict[tens] == "" {
      res = dict[tens/10] + "ty"
    }
    if dict[ones] != "" {
      res += " " + dict[ones]
    }
    return res
  }
}

func hundredsToWords(hundreds int) string {
  if hundreds <= 0 { return "" }
  return dict[hundreds] + " Hundred"
}

func belowThousandsToWords(num int) (string, int) {
  // tens
  tens := num % 100
  num -= tens
  num /= 100
  res := tensToWords(tens)
  if num <= 0 { return res, num }

  // hundreds
  hundreds := num % 10
  num -= hundreds
  num /= 10
  hundredsStr := hundredsToWords(hundreds)
  if hundredsStr != "" {
    if res == "" {
      res = hundredsStr
    } else {
      res = hundredsStr + " " + res
    }
  }

  return res, num
}

func aboveThousandsToWords(num int, unit string) string {
  res, _ := belowThousandsToWords(num)
  if res != "" {
    res += " " + unit
  }
  return res
}
