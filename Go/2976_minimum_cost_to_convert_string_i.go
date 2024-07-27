func minimumCost(source string, target string, original []byte, changed []byte, cost []int) int64 {
  // prepare the edges & vertices
  keys := make(map[string]struct{})
  keysArr := []string{}
  costs := make(map[string]map[string]int)
  for _, char := range string(source+target) {
    keys[string(char)] = struct{}{}
  }
  for i, char := range original {
    keys[string(char)] = struct{}{}
    keys[string(changed[i])] = struct{}{}
    if costs[string(char)] == nil {
      costs[string(char)] = make(map[string]int)
    }
    if costs[string(changed[i])] == nil {
      costs[string(changed[i])] = make(map[string]int)
    }
    // in case there are multiple same vertices with difference value
    if costs[string(char)][string(changed[i])] == 0 || costs[string(char)][string(changed[i])] > cost[i] {
      costs[string(char)][string(changed[i])] = cost[i]
    }
  }

  // put keys in array so the order will be static when being iterated
  for i, _ := range keys {
    keysArr = append(keysArr, i)
  }

  for _, i := range keysArr {
    for _, j := range keysArr {
      for _, k := range keysArr {
        if costs[k] == nil {
          costs[k] = make(map[string]int)
        }
        if i == k { continue }

        if (costs[j][k] == 0 || costs[j][k] > costs[j][i] + costs[i][k]) && costs[j][i] != 0 && costs[i][k] != 0 {
          costs[j][k] = costs[j][i] + costs[i][k]
        }
      }
    }
  } 
  
  res := 0
  for i, char := range source {
    if string(char) == string(target[i]) { continue }

    val, ok := costs[string(char)][string(target[i])]
    if !ok || val == 0 { return -1 }

    res += val
  }

  return int64(res)
}
