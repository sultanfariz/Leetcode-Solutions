func findMinDifference(timePoints []string) int {
  // convert timepoint into minute integer
  MAX := 1440
  minutes := []int{}
  minutesMap := map[int]bool{}
  for _, point := range timePoints {
    splitted := strings.Split(point, ":")
    h, _ := strconv.Atoi(splitted[0])
    m, _ := strconv.Atoi(splitted[1])

    minute := h * 60 + m
    minutes = append(minutes, minute)
    if minutesMap[minute] {
      return 0
    }
    minutesMap[minute] = true
  }

  sort.Ints(minutes)

  min := -1
  n := len(minutes)
  for i := range minutes {
    diff := minutes[0] + MAX - minutes[i]
    if i < n-1 { 
      diff = minutes[i+1] - minutes[i]
    }
    if min > diff || min < 0 { 
      min = diff 
    }  
  }

  return min
}
