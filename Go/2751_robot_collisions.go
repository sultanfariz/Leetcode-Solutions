type Robot struct {
  Position int
  Health int
  Direction int
}

func survivedRobotsHealths(positions []int, healths []int, directions string) []int {
  // map directions into -1 or 1 
  directionsArr := []int{}
  for _, v := range directions {
    if string(v) == "L" {
      directionsArr = append(directionsArr, -1)
    } else {
      directionsArr = append(directionsArr, 1)
    }
  }

  // map all array into hashmap
  robotMap := make(map[int]Robot)
  positionsSorted := []int{}
  for i, v := range positions {
    robotMap[v] = Robot{Position: v, Health: healths[i], Direction: directionsArr[i]}
    positionsSorted = append(positionsSorted, v)
  }
  sort.Ints(positionsSorted)
  

  // simulate collision
  counter := 0
  res, stack := make(map[int]Robot), []Robot{}
  for _, k := range positionsSorted {
    v := robotMap[k]
    if v.Direction > 0 {
      stack = append(stack, v)
      counter++
    } else {
      right := v
      for {
        if counter <= 0 {
          res[right.Position] = right
          break
        }
        left := stack[counter-1]
        remain := left.Health - right.Health
        if remain > 0 {
          stack[counter-1].Health--
          break
        } else if remain < 0 {
          counter--
          stack = stack[:counter]
          right.Health--
        } else {
          counter--
          stack = stack[:counter]
          break
        }
      }
    }
  }

  for _,v := range stack {
    res[v.Position] = v
  }

  result := []int{}
  for _, v := range positions {
    robot, ok := res[v]
    if ok {
      result = append(result, robot.Health)
    }
  }

  return result
}
