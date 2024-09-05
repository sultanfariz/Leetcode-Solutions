func robotSim(commands []int, obstacles [][]int) int {
  // Transform obstacles into a map for quick lookup
  obstacleMap := map[int]map[int]bool{}
  for _, obs := range obstacles {
    if _, exists := obstacleMap[obs[0]]; !exists {
      obstacleMap[obs[0]] = make(map[int]bool)
    }
    obstacleMap[obs[0]][obs[1]] = true
  }

  var traverse func(x, y, direction, command int) (int, int, int)
  traverse = func(x, y, direction, command int) (int, int, int) {
    dx := []int{0, 1, 0, -1} // Directions for x-axis: north, east, south, west
    dy := []int{1, 0, -1, 0} // Directions for y-axis: north, east, south, west
    
    for command > 0 {
      nextX := x + dx[direction]
      nextY := y + dy[direction]

      // Check if the next position is an obstacle
      if obstacleMap[nextX][nextY] {
        return x, y, direction
      }

      x, y = nextX, nextY
      command--
    }

    return x, y, direction
  }

  // Simulation
  x, y, maxDist, direction := 0, 0, 0, 0
  for _, command := range commands {
    switch command {
    case -1:
      direction = (direction + 1) % 4
    case -2:
      direction = (direction + 3) % 4
    default:
      x, y, direction = traverse(x, y, direction, command)
    }

    dist := calcDist(x, y)
    if maxDist < dist {
      maxDist = dist
    }
  }

  return maxDist
}

func calcDist(x, y int) int {
  return (x * x) + (y * y)
}
