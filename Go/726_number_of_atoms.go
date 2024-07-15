func countOfAtoms(formula string) string {
  var (
    keys = []string{}
    res = ""
  )

  elemMap, _ := molecules2Map(formula)

  // sort map keys for sorted output
  for k, _ := range elemMap {
    keys = append(keys, k)
  }
  sort.Strings(keys)

  // arrange elements map into formula string
  for _, k := range keys {
    v := elemMap[k]
    molecule := fmt.Sprintf("%s%d", k, v)
    if v == 1 { molecule = k }
    res += molecule
  }

  return res
}

func molecules2Map(formula string) (map[string]int, string) {
  var (
    n = len(formula)
    elemMap = make(map[string]int)
    currElem, currCount = "", ""
    multiplier, i = 1, 0
    isClosed = false
  )

  for i=0; i<n; i++ {
    char := formula[i]
    if char >= 48 && char <= 57 {
      currCount += string(char)
      continue
    } 

    // if reached close bracket, return the inner bracket elements map
    if isClosed { 
      count := str2Int(currCount)
      if count > 0 {
        multiplier = count
      }
      break 
    }

    // if the count stopped counting (encounter non-integer char), put the element into map
    if currCount != "" {
      elemMap[currElem] += str2Int(currCount)
      currElem = ""
      currCount = ""
    }
    
    if char >= 65 && char <= 90 {
      if currElem != "" {
        elemMap[currElem]++
      }
      currElem = string(char)
    } else if char >= 97 && char <= 122 {
      currElem = currElem + string(char)
    } else if char == 40 {
      // here's the recursive inner bracket elements counting takes place
      childElemMap, remainStr := molecules2Map(formula[i+1:])
      for k, v := range childElemMap {
        elemMap[k] += v
      }
      formula = formula[:i] + remainStr
      n = len(formula)
      i--
    } else if char == 41 {
      if currElem != "" {
        elemMap[currElem]++
      }
      currElem = ""
      currCount = ""
      isClosed = true
    }
  }

  if currCount != "" && currElem != "" {
    elemMap[currElem] += str2Int(currCount)
    currElem = ""
    currCount = ""
  } else if currElem != "" {
    elemMap[currElem]++
    currElem = ""
  } else if currCount != "" {
    count := str2Int(currCount)
    if count > 0 {
      multiplier = count
    }
  }

  for k, v := range elemMap {
    elemMap[k] = v*multiplier
  }
  
  return elemMap, formula[i:]
}

func str2Int(str string) int {
  res, _ := strconv.Atoi(str)
  return res
}
